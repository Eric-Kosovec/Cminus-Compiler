/*******************************************************/
/* Cminus Parser                                       */
/*  Compiles a Cminus program into MIPS assembly code. */
/*                                                     */
/* to compile:                                         */
/*  make                                               */
/*                                                     */
/*  Modified by Eric Kosovec                           */
/*                                                     */
/*******************************************************/

/*********************DEFINITIONS***********************/
%{
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <sys/types.h>

#include <util/general.h>
#include <util/symtab.h>
#include <util/symtab_stack.h>
#include <util/dlink.h>
#include <util/string_utils.h>
#include <util/ptr_convert.h>

#include "mips_mgmt.h"
#include "typesystem.h"
#include "cminus_variable.h"

#define SYMTABLE_SIZE 100
#define SYMTAB_VALUE_FIELD "value"
#define SYMTAB_TYPE_FIELD "type"
#define SYMTAB_VARIABLE_FIELD "variable"

/*********************EXTERNAL DECLARATIONS***********************/

EXTERN(void, Cminus_error, (const char*));
EXTERN(void, Cminus_general_error, (const char*));
EXTERN(int, Cminus_lex, (void));

/*********************GLOBAL DECLARATIONS***********************/

type_metadata * get_type(SymTable symtab, int index);
void set_type_struct(SymTable symtab, int index, type_metadata * tmd);
void set_type(SymTable symtab, int index, data_type type, size_t bytes);
int get_int_value(SymTable symtab, int index);
char * get_str_value(SymTable symtab, int index);
void set_int_value(SymTable symtab, int index, int value);
void set_str_value(SymTable symtab, int index, char * value);
void set_variable_info(SymTable symtab, int index, cminus_variable_t * cvar);
cminus_variable_t * get_variable_info(SymTable symtab, int index);

/*********************STATIC DECLARATIONS***********************/
STATIC(void, print_usage, (void));
STATIC(SymTable, get_vars_scope, (SymtabStack scope_stack, char * var));
STATIC(bool, is_global_variable, (SymtabStack, char *));
STATIC(bool, is_name_defined, (const SymTable, char *));
STATIC(void, declare_scope, (SymtabStack));
STATIC(void, destroy_scope, (SymtabStack));
STATIC(int, get_name_index, (SymTable, char *));
STATIC(int, set_name, (SymTable, char *));
STATIC(bool, is_main, (const char *));
STATIC(bool, is_curr_scope_global, (SymtabStack));

char * filename;

// Holds variable information for the global scope and local function scope.
SymtabStack scope_stack;

// Holds all function names defined.
SymTable function_data;

// Holds all string labels defined.
SymTable string_list;

// Stack to help with tracking nested while loops.
DLinkList while_stack;
DLinkList if_stack;

// The function currently being compiled.
static char * curr_function = NULL;

// Indicates whether the function being compiled has a return statement.
static bool has_ret_statement = false;

static cminus_type_t declare_type;

// Defines an offset from the fp for local variables in functions.
extern int g_FP_NEXT_OFFSET;

extern int Cminus_lineno;

extern FILE * Cminus_in;
%}

%name-prefix "Cminus_"
%defines

%start Program

%union {
	int ival;
	float fval;
	unsigned long ulval;
	char * sval;
}

%token AND
%token ELSE
%token EXIT
%token FOR
%token IF 		
%token INTEGER
%token FLOAT
%token NOT 		
%token OR 		
%token READ
%token WHILE
%token WRITE
%token LBRACE
%token RBRACE
%token LE
%token LT
%token GE
%token GT
%token EQ
%token NE
%token ASSIGN
%token COMMA
%token SEMICOLON
%token LBRACKET
%token RBRACKET
%token LPAREN
%token RPAREN
%token PLUS
%token TIMES
%token IDENTIFIER
%token DIVIDE
%token RETURN
%token STRING	
%token INTCON
%token FLOATCON
%token MINUS

%left OR
%left AND
%left NOT
%left LT LE GT GE NE EQ
%left PLUS MINUS
%left TIMES DIVDE

%type<ival> STRING INTCON Constant Variable Expr SimpleExpr AddExpr MulExpr Factor
%type<ulval> WHILE IF Test TestAndThen WhileExpr
%type<sval> IDENTIFIER StringConstant

/***********************PRODUCTIONS****************************/
%%
Program : Procedures 
		{
			
		}
		| DeclList Procedures
		{
			
		}
		;

Procedures : ProcedureDecl Procedures
		{
			
		}
		| ProcedureDecl
		{
			
		}
		;

ProcedureDecl : ProcedureHead ProcedureBody
		{
			
		}
		;

ProcedureHead : FunctionDecl DeclList 
		{
			
		}
		| FunctionDecl
		{
			
		}
		;

FunctionDecl : Type IDENTIFIER LPAREN RPAREN LBRACE 
		{
			curr_function = $2;
			
			// There is no method overloading or redefining allowed in Cminus.
			if (is_name_defined(function_data, curr_function)) {
				Cminus_error("Function already defined.");
				exit(-1);
			}
			
			/*
			 * Offset from the caller's fp location on the current call frame.
			 * This is meant for giving variables a space on the stack.
			 */
			g_FP_NEXT_OFFSET = 0;
			
			// Record the function name.
			set_name(function_data, curr_function);
			
			// Function will have its own scope of variables.
			declare_scope(scope_stack);
			
			print_function_label(curr_function);
			
			/*
			 * Don't need to do function calling code for main, as
			 * in my Cminus (even though it's not in the spec),
			 * recursive main calls are not allowed.
			 */
			if (!is_main(curr_function)) {
				postcall();
			}
		}
		;

ProcedureBody : StatementList RBRACE
		{
			destroy_scope(scope_stack);
			
			// Allow only the main to not have a return value.
			if (!is_main(curr_function) && !has_ret_statement) {
				Cminus_error("Function needs to return a value.");
				exit(-1);
			}
			
			else if (is_main(curr_function) && !has_ret_statement) {
				print_epilog(ZERO);
			}
			
			curr_function = NULL;
			
			has_ret_statement = false;
		}
		;

DeclList : Type IdentifierList SEMICOLON 
		{
			
		}
		| DeclList Type IdentifierList SEMICOLON
		{
			
		}
		;

IdentifierList : VarDecl  
		{
			
		}
		| IdentifierList COMMA VarDecl
		{
			
		}
		;

VarDecl : IDENTIFIER
		{
			// TODO STORE TYPE INFO ETC WITH VARIABLE USING TYPE PORTION ABOVE
			// THIS IS FOR WHEN WE INTRODUCE FLOATS AND HAVE TO INTER-MIX INTS AND
			// FLOATS WITH MATH/MEMORY
			
			/*
			 * The variable declaration must be in the current scope. In the
			 * case of a global variable, the current scope (the one on top of the
			 * scope stack) is the global scope. In the case of a function variable,
			 * the current scope will be the function's scope.
			 */
			
			// Disallow ambiguous double declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), $1)) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}
			
			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), $1);
			int offset = 0;
			
			if (is_curr_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += CMINUS_SIZEOF(declare_type); // next slot for a 4 byte value.	
			}
			
			else {
				g_FP_NEXT_OFFSET -= CMINUS_SIZEOF(declare_type); // no offset can be 0, so must subtract first.
				offset = g_FP_NEXT_OFFSET;
				
				// Move stack pointer to location of the new variable.
				// Essentially "pushing" the variable onto the stack without initializing.
				ISSUE_ADDI(SP, SP, -CMINUS_SIZEOF(declare_type));
				
				// Note: Offset from FP will be negative, as stack looks as such:
				//					Locals      low addr
				//		fp -->	Caller's fp     high addr
			}
			
			cminus_variable_t * cvar = cminus_var_create(declare_type);
			
			if (cvar == NULL) {
				fprintf(stderr, "Could not allocate memory for variable info.\n");
				exit(-1);
			}
			
			cminus_var_set_memoffset(cvar, offset);
			set_variable_info(currentSymtab(scope_stack), index, cvar);
			
			set_int_value(currentSymtab(scope_stack), index, offset);
			set_type(currentSymtab(scope_stack), index, INT, CMINUS_SIZEOF(declare_type));
		}
		| IDENTIFIER LBRACKET INTCON RBRACKET
		{	
			if ($3 <= 0) {
				Cminus_error("Array size cannot be zero or negative.");
				exit(-1);
			}
			
			// Disallow ambiguous double declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), $1)) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}
			
			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), $1);
			int offset = 0;
			
			if (is_curr_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += $3 * CMINUS_SIZEOF(declare_type); // Set offset past the array.
			}
			
			else {
				offset = g_FP_NEXT_OFFSET - CMINUS_SIZEOF(declare_type);
				g_FP_NEXT_OFFSET -= $3 * CMINUS_SIZEOF(declare_type); // Set offset to end of the array.
				
				// Set sp to end of array.
				ISSUE_ADDI(SP, SP, -($3 * CMINUS_SIZEOF(declare_type)));
			}
			
			cminus_variable_t * cvar = cminus_var_create(declare_type);
			
			if (cvar == NULL) {
				fprintf(stderr, "Could not allocate memory for variable info.\n");
				exit(-1);
			}
			
			cminus_var_set_memoffset(cvar, offset);
			cminus_var_set_arraydata(cvar, declare_type, $3);

			set_variable_info(currentSymtab(scope_stack), index, cvar);
			
			set_int_value(currentSymtab(scope_stack), index, offset); // base of array
			set_type(currentSymtab(scope_stack), index, INT_ARRAY, $3 * CMINUS_SIZEOF(declare_type)); // bytes is length * int bytes
		}
		;

Type : INTEGER 
		{ 
			declare_type = CMINUS_INT;
		}
		| FLOAT
		{
			declare_type = CMINUS_FLOAT;
		}
		;

Statement : Assignment
		{ 
			
		}
		| IfStatement
		{ 
		
		}
		| WhileStatement
		{ 
		
		}
		| IOStatement 
		{ 
		
		}
		| ReturnStatement
		{ 
			has_ret_statement = true;
		}
		| ExitStatement	
		{ 
			
		}
		| CompoundStatement
		{ 
			
		}
		;

Assignment : Variable ASSIGN Expr SEMICOLON
		{
			// Variable is register holding variable's address.
			issue_sw($3, $1, 0);
			reg_free($1);
			reg_free($3);
		}
		;
		
IfStatement : IfToken TestAndThen ElseToken CompoundStatement
		{
			// Label to jump to that comes after else, incase the if statement
			// evaluates to true.
			print_after_else_label($2);
			
			DLinkNode * victim_if_node = dlinkPop(&if_stack);
			dlinkFreeNode(victim_if_node);
		}
		| IfToken TestAndThen
		{
			// Prints the label to jump to incase the if statement evaluates to false.
			// An if can have no else statement, thus refer to no else and an else as
			// if end.
			print_if_end_label($2);
			
			// Remove the current if from the stack.
			DLinkNode * victim_if_node = dlinkPop(&if_stack);
			dlinkFreeNode(victim_if_node);
		}
		;
		
TestAndThen : Test CompoundStatement
		{
			$$ = $1;
		}
		;

Test : LPAREN Expr RPAREN
		{
			// Get the current if number.
			DLinkNode * if_node = dlinkHead(&if_stack);
			unsigned long if_number = PTR_AS_ULONG(dlinkNodeAtom(if_node));
			
			char * if_end_label = get_if_end_label(if_number);
			
			if (if_end_label == NULL) {
				fprintf(stderr, "Could not allocate memory for label.\n");
				exit(-1);
			}
			
			ISSUE_BEQ($2, ZERO, if_end_label);
			
			free(if_end_label);
			
			reg_free($2);
			
			$$ = if_number;
		}
		;
	
IfToken : IF 
		{
			// Put the if's number from $1 onto the stack of if statement numbers.
			DLinkNode * new_if = dlinkNodeAlloc(ULONG_AS_PTR($1));
			dlinkPush(new_if, &if_stack);
		}
		;
		
ElseToken : ELSE
		{
			// Get the if number the else is associated with.
			DLinkNode * if_node = dlinkHead(&if_stack);
			unsigned long if_number = PTR_AS_ULONG(dlinkNodeAtom(if_node));
			
			char * after_else_label = get_after_else_label(if_number);
			
			if (after_else_label == NULL) {
				fprintf(stderr, "Could not allocate memory for label.\n");
				exit(-1);
			}
			
			// insert jump to come after the else.
			issue_j(after_else_label);
			
			free(after_else_label);
			
			print_if_end_label(if_number);
		}
		;

WhileStatement : WhileToken WhileExpr Statement
		{	
			// Exiting the while loop, so must remove its number from the stack.
			DLinkNode * victim_while_node = dlinkPop(&while_stack);
			dlinkFreeNode(victim_while_node);
			
			char * while_start_label = get_while_start_label($2);
			
			if (while_start_label == NULL) {
				fprintf(stderr, "Could not allocate memory for label.\n");
				exit(-1);
			}
			
			// Insert jump back to the start of the while loop.
			issue_j(while_start_label);
			
			free(while_start_label);
			
			print_while_end_label($2);
		}
		;

WhileExpr : LPAREN Expr RPAREN
		{			
			// Get the while loop the code is in, which is at the top of the stack.
			DLinkNode * while_node = dlinkHead(&while_stack);
			unsigned long while_number = PTR_AS_ULONG(dlinkNodeAtom(while_node));
			
			char * while_end_label = get_while_end_label(while_number);
			
			if (while_end_label == NULL) {
				fprintf(stderr, "Could not allocate memory for label.\n");
				exit(-1);
			}
			
			// Expr will be the register containing true or false at this point.
			// Test and jump if need be to the end of the while loop.
			ISSUE_BEQ($2, ZERO, while_end_label);
			
			free(while_end_label);
			
			reg_free($2);
			
			$$ = while_number;
		}
		;
	
WhileToken : WHILE
		{
			// Insert while number into while stack to mark the code is in 
			// a new while loop.
			DLinkNode * new_while = dlinkNodeAlloc(ULONG_AS_PTR($1));
			dlinkPush(new_while, &while_stack);
			
			// Insert the while's label using the number into the code.
			print_while_start_label($1);
		}
		;

IOStatement : READ LPAREN Variable RPAREN SEMICOLON
		{
			read_int($3); // read value from stdin and store into variable's location
			reg_free($3);
		}
		| WRITE LPAREN Expr RPAREN SEMICOLON
		{
			write_reg_value($3);
			reg_free($3);
			write_new_line();
		}
		| WRITE LPAREN StringConstant RPAREN SEMICOLON         
		{
			write_const_string($3);
			write_new_line();
		}
		;

ReturnStatement : RETURN Expr SEMICOLON
		{	
			if (curr_function == NULL) {
				fprintf(stderr, "Null current function. Compiler bug.\n");
				exit(-1);
			}

			// Only do prereturn if not returning from the main 
			// function...
			if (!is_main(curr_function)) {
				// Send the return value into the result register.
				issue_move(V0, $2);
				prereturn();
			}
			
			// Otherwise, just exit the program.
			else {
				print_epilog($2);
			}
			
			reg_free($2);
		}
		;

ExitStatement : EXIT SEMICOLON
		{
			// Print out program end code.
			print_epilog(ZERO);
		}
		;

CompoundStatement : LBRACE StatementList RBRACE
		{
			
		}
		;

StatementList : Statement
		{		
			
		}
		| StatementList Statement
		{		
			
		}
		;

Expr : SimpleExpr
		{
			$$ = $1;
		}
		| Expr OR SimpleExpr 
		{
			ISSUE_OR($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| Expr AND SimpleExpr 
		{
			ISSUE_AND($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| NOT SimpleExpr 
		{
			ISSUE_SEQ($2, $2, ZERO);
			$$ = $2;
		}
		;

SimpleExpr : AddExpr
		{
			$$ = $1;
		}
		| SimpleExpr EQ AddExpr
		{
			ISSUE_SEQ($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| SimpleExpr NE AddExpr
		{
			ISSUE_SNE($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| SimpleExpr LE AddExpr
		{
			ISSUE_SLE($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| SimpleExpr LT AddExpr
		{
			ISSUE_SLT($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| SimpleExpr GE AddExpr
		{
			ISSUE_SGE($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| SimpleExpr GT AddExpr
		{
			ISSUE_SGT($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		;

AddExpr : MulExpr            
		{
			$$ = $1;
		}
		| AddExpr PLUS MulExpr
		{
			ISSUE_ADD($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| AddExpr MINUS MulExpr
		{
			ISSUE_SUB($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		;

MulExpr	: Factor
		{
			$$ = $1;
		}
		| MulExpr TIMES Factor
		{
			ISSUE_MUL($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		| MulExpr DIVIDE Factor
		{
			ISSUE_DIV($1, $1, $3);
			reg_free($3);
			$$ = $1;
		}
		;

Factor : Variable
		{ 
			// Variable is reg holding variable's location.
			issue_lw($1, $1, 0);
			$$ = $1;
		}
		| Constant
		{ 
			// TODO: MAYBE CHECK FOR ZERO AND USE ZERO REG, BUT MAYBE
			// SOMETHING ELSE WILL TRY TO WRITE INTO THE CONSTANT REG???
			reg_idx_t reg = reg_alloc();
			issue_li(reg, $1);
			$$ = reg;
		}
		| IDENTIFIER LPAREN RPAREN
		{
			if (is_main($1)) {
				Cminus_error("Cannot recursively call main.");
				exit(-1);
			}
	
			// Make sure the method exists.
			if (!is_name_defined(function_data, $1)) {
				Cminus_error("Function does not exist.");
				exit(-1);
			}
			
			// Code to set up activation record and jumping to the function.
			precall($1);
			
			// Code to grab data off the stack after coming back from function call.
			postreturn();
			
			// Returning V0 will bubble up into Expr and the only
			// case in which this would matter would be in assignment, which
			// is exactly what we would like to do.
			$$ = V0;
		}
		| LPAREN Expr RPAREN
		{
			$$ = $2;
		}
		;

Variable : IDENTIFIER
		{
			SymTable scope = get_vars_scope(scope_stack, $1);
			
			int index = SymQueryIndex(scope, $1);
			
			// TODO ABSTRACT AWAY GETTING TYPES, ETC.
			
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}
			
			// Get the variable's metadata.
			type_metadata * meta = get_type(scope, index);
			
			if (meta == NULL) {
				fprintf(stderr, "Null type metadata returned. Compiler bug.\n");
				exit(-1);
			}
			
			data_type type = type_metadata_get_type(meta);
			
			// Should not be able to treat an array name as a regular variable.
			if (type == INT_ARRAY) {
				Cminus_error("Array identifier needs a specified index.");
				exit(-1);
			}
			
			// TODO TRANSFORM TO METHOD CALL - GET VARIABLE MEMORY ADDR
			
			int offset = get_int_value(scope, index); // TODO RENAME METHOD
			int base = (is_global_variable(scope_stack, $1) ? GP : FP);
			
			reg_idx_t reg = reg_alloc();
			
			if (offset != 0) {
				ISSUE_ADDI(reg, base, offset);	
			}
			
			else {
				issue_move(reg, base);
			}
			
			$$ = reg; // register holding variable location.
		}
		| IDENTIFIER LBRACKET Expr RBRACKET
		{
			// Expr is reg in which value lies.
			
			SymTable scope = get_vars_scope(scope_stack, $1);
			
			int index = SymQueryIndex(scope, $1);
			
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}
			
			int offset = get_int_value(scope, index); // array start (offset from gp or fp)
			
			// Get the variable's metadata.
			type_metadata * meta = get_type(scope, index);
			
			if (meta == NULL) {
				Cminus_general_error("Null type metadata returned. Compiler bug.\n");
				exit(-1);
			}
			
			data_type type = type_metadata_get_type(meta);
			
			// Should not be able to treat a regular variable as an array.
			if (type != INT_ARRAY) {
				Cminus_error("Identifier is not an integer array.");
				exit(-1);
			}
			
			// TODO FURTHER EXPLAIN
			
			// Calculation of gp offset is as follows: 
			// array base + (4 * $Expr), where $Expr is the value in the register 
			// defined by Expr.
			
			ISSUE_SLL($3, $3, 2); // 4 * $Expr
			
			if (is_global_variable(scope_stack, $1)) {
				ISSUE_ADD($3, $3, GP); // (4 * $Expr) + $GP
				
				// Useless to issue an instruction to add 0.
				if (offset != 0) {
					ISSUE_ADDI($3, $3, offset); // $GP + array base offset + (4 * $Expr)
				}
			}
			
			// Local variable, which has an offset from the FP register.
			// Offsets from FP are negative.
			else {
				if (offset != 0) {
					ISSUE_ADDI($3, $3, -offset); // (4 * $Expr) + -base
				}
				
				ISSUE_SUB($3, FP, $3); // FP - (-base + (4 * $Expr))
			}
			
			$$ = $3; // holds variable location
		}
		;

StringConstant : STRING
		{ 
			$$ = (char *)SymGetFieldByIndex(string_list, $1, SYM_NAME_FIELD);
		}
		;

Constant : INTCON
		{ 
			$$ = $1;
		}
		;
		
%%

/********************C ROUTINES *********************************/

void
Cminus_error(const char * s)
{
	fprintf(stderr, "%s: line %d: %s\n", filename, Cminus_lineno, s);
}

void
Cminus_general_error(const char * s)
{
	fprintf(stderr, "%s: %s\n", filename, s);
}

int
Cminus_wrap()
{
	return 1;
}

static void
initialize(char * input_filename)
{
	Cminus_in = fopen(input_filename, "r");
	
	if (Cminus_in == NULL) {
		fprintf(stderr, "Error: Could not open file %s\n", input_filename);
		exit(-1);
	}

	char * dot = rindex(input_filename, '.');
	int end_index = strlen(input_filename) - strlen(dot);
	char * input_no_ext = substr(input_filename, 0, end_index);
	char * output_filename = nssave(2, input_no_ext, ".s");
	free(input_no_ext);
	stdout = freopen(output_filename, "w", stdout);
	free(output_filename);
	
	if (stdout == NULL) {
		fprintf(stderr, "Error: Could not open file %s\n", output_filename);
		exit(-1);
	}
	
	scope_stack = symtabStackInit();

	// declare global scope
	declare_scope(scope_stack);
	
	function_data = SymInit(SYMTABLE_SIZE);
	string_list = SymInit(SYMTABLE_SIZE);
	
	// Initialize the while loop stack to track while loop numbers.
	dlinkListInit(&while_stack, INT_AS_PTR(-1));
	
	// Initialize the if statement stack to track if statement numbers.
	dlinkListInit(&if_stack, INT_AS_PTR(-1));
}

static void
finalize()
{
	symtabStackFree(scope_stack);
	
	if (SymQueryIndex(function_data, "main") == SYM_INVALID_INDEX) {
		Cminus_general_error("No main method defined.");
		exit(-1);
	}
	
	SymKill(function_data);
	SymKill(string_list);
	
	// Free memory used by tracking while loops and if statements.
	dlinkFreeNodes(&while_stack);
	dlinkFreeNodes(&if_stack);
	
	fclose(Cminus_in);
	fclose(stdout);
}

static void 
print_usage(void)
{
	printf("Usage: cmc [.cm file path]\n");
}

int
main(int argc, char * argv[])
{
	if (argc <= 1) {
		print_usage();
		return -1;
	}

	filename = argv[1];
	initialize(filename);
	
	print_prolog();

	Cminus_parse();

	print_string_labels();
  
	finalize();
  
	return 0;
}

SymTable
get_vars_scope(SymtabStack scope_stack, char * var)
{
	SymTable scope = NULL;
	bool is_global;
	
	if (scope_stack && var) {
		is_global = is_global_variable(scope_stack, var);
		
		// Now must get from appropriate symtable
		scope = (is_global ? lastSymtab(scope_stack) : currentSymtab(scope_stack));
	}

	return scope;
}

inline type_metadata *
get_type(SymTable symtab, int index)
{
	return (type_metadata *)SymGetFieldByIndex(symtab, index, SYMTAB_TYPE_FIELD);
}

inline cminus_variable_t *
get_variable_info(SymTable symtab, int index)
{
	return (cminus_variable_t *)SymGetFieldByIndex(symtab, index, SYMTAB_VARIABLE_FIELD);
}

inline void
set_variable_info(SymTable symtab, int index, cminus_variable_t * cvar)
{
	SymPutFieldByIndex(symtab, index, SYMTAB_VARIABLE_FIELD, (Generic)cvar);
}

inline void
set_type_struct(SymTable symtab, int index, type_metadata * tmd)
{
	SymPutFieldByIndex(symtab, index, SYMTAB_TYPE_FIELD, (Generic)tmd);
}

void
set_type(SymTable symtab, int index, data_type type, size_t bytes)
{
	// Create the type metadata structure with the given arguments.
	type_metadata * metadata = type_metadata_create();
	
	if (metadata == NULL) {
		Cminus_general_error("Failed to allocate memory.\n");
		exit(-1);
	}
	
	type_metadata_init(metadata, type, bytes);
	
	SymPutFieldByIndex(symtab, index, SYMTAB_TYPE_FIELD, (Generic)metadata);
}

inline int
get_int_value(SymTable symtab, int index)
{
	return PTR_AS_INT(SymGetFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD));
}

// TODO RENAME AS APPROPRIATE
inline char *
get_str_value(SymTable symtab, int index)
{
	return (char *)SymGetFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD);
}

inline void
set_int_value(SymTable symtab, int index, int value)
{
	SymPutFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD, INT_AS_PTR(value));
}

inline void
set_str_value(SymTable symtab, int index, char * value)
{
	SymPutFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD, (Generic)value);
}

static void
declare_scope(SymtabStack stack)
{
	if (stack) {
		SymTable new_scope = beginScope(stack);
		SymInitField(new_scope, SYMTAB_VALUE_FIELD, INT_AS_PTR(-1), NULL);
		SymInitField(new_scope, SYMTAB_TYPE_FIELD, INT_AS_PTR(-1), NULL);
	}
}

static void
destroy_scope(SymtabStack stack)
{
	if (stack && stackSize(stack) > 0) {
		SymTable old_scope = endScope(stack);
		SymKillField(old_scope, SYMTAB_TYPE_FIELD);
		SymKillField(old_scope, SYMTAB_VALUE_FIELD);
		SymKill(old_scope);
	}
}

static int
get_name_index(SymTable symtab, char * name)
{
	if (!symtab || !name) {
		Cminus_general_error("get_name_index given a null pointer. Compiler bug.\n");
		exit(-1);
	}
	
	return SymQueryIndex(symtab, name);
}

static int
set_name(SymTable symtab, char * name)
{
	if (!symtab || !name) {
		Cminus_general_error("set_name given a null pointer. Compiler bug.\n");
		exit(-1);
	}

	return SymIndex(symtab, name);
}

static bool
is_global_variable(SymtabStack stack, char * identifier_name)
{
	bool is_global = false;
	
	// Check the local scope for the variable.
	int index = SymQueryIndex(currentSymtab(stack), identifier_name);
	
	// Didn't find the variable in local scope, so should be global, or
	// found the variable, but only the global scope exists, thus it must be global.
	if (index == SYM_INVALID_INDEX || (index != SYM_INVALID_INDEX && stackSize(stack) <= 1)) {
		is_global = true;
	}
	
	// Neither local or global scope, so error.
	if (is_global && (SymQueryIndex(lastSymtab(stack), identifier_name) == SYM_INVALID_INDEX)) {
		fprintf(stderr, "Identifier %s could not be found.\n", identifier_name);
		exit(-1);
	}
	
	return is_global;
}

static bool
is_name_defined(const SymTable symtab, char * name)
{
	if (symtab == NULL || name == NULL) {
		Cminus_general_error("is_name_defined given a null pointer. Compiler bug.\n");
		exit(-1);
	}
	
	return SymQueryIndex(symtab, name) != SYM_INVALID_INDEX;
}

static inline bool
is_curr_scope_global(SymtabStack scope_stack)
{
	return stackSize(scope_stack) == 1;
}

static inline bool
is_main(const char * function_name)
{
	return strcmp(function_name, "main") == 0;
}

/******************END OF C ROUTINES**********************/
