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
#include "type_system.h"

#define SYMTABLE_SIZE 100
#define SYMTAB_VALUE_FIELD "value"
#define SYMTAB_VARIABLE_FIELD "variable"

/*********************EXTERNAL DECLARATIONS*********************/
EXTERN(void, Cminus_error, (const char *));
EXTERN(void, Cminus_general_error, (const char *));
EXTERN(void, Cminus_compiler_error, (const char *));
EXTERN(int, Cminus_lex, (void));

/*********************GLOBAL DECLARATIONS***********************/
int get_int_field(SymTable symtab, int index, char * field);
void set_int_field(SymTable symtab, int index, char * field, int value);
void * get_ptr_field(SymTable symtab, int index, char * field);
void set_ptr_field(SymTable symtab, int index, char * field, void * value);

/*********************STATIC DECLARATIONS***********************/
STATIC(void, print_usage, (void));
STATIC(SymTable, variables_scope, (SymtabStack scope_stack, char * var));
STATIC(bool, is_global_variable, (SymtabStack, char *));
STATIC(bool, is_name_defined, (const SymTable, char *));
STATIC(void, declare_scope, (SymtabStack));
STATIC(void, destroy_scope, (SymtabStack));
STATIC(int, get_name_index, (SymTable, char *));
STATIC(int, set_name, (SymTable, char *));
STATIC(bool, is_main, (const char *));
STATIC(bool, is_scope_global, (SymtabStack));

// Holds all defined function names.
SymTable function_data;

// Holds all defined string labels.
SymTable string_list;

// Holds variable information for the global scope and local function scope.
static SymtabStack scope_stack;

// Stacks to track nested while loops/ifs.
static DLinkList while_stack;
static DLinkList if_stack;

static cminus_type_t identifier_type = INVALID_TYPE;

static char * filename = NULL;

// The function currently being compiled.
static char * curr_function = NULL;

// Indicates whether the function being compiled has a return statement.
static bool has_ret_stmt = false;

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
			if (SymQueryIndex(function_data, "main") == SYM_INVALID_INDEX) {
				Cminus_general_error("No main function defined.");
				exit(-1);
			}
		}
		| DeclList Procedures
		{
			if (SymQueryIndex(function_data, "main") == SYM_INVALID_INDEX) {
				Cminus_general_error("No main function defined.");
				exit(-1);
			}
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
			// Make space for local variables.
			ISSUE_ADDI(SP, SP, g_FP_NEXT_OFFSET);
		}
		| FunctionDecl
		{

		}
		;

FunctionDecl : Type IDENTIFIER LPAREN RPAREN LBRACE 
		{
			curr_function = $2;
			
			// There is no function overloading or redefining allowed in Cminus.
			if (is_name_defined(function_data, curr_function)) {
				Cminus_error("Function already defined.");
				exit(-1);
			}
			
			/*
			 * Offset from the caller's FP location on the current call frame.
			 * This is meant for giving variables a space on the stack.
			 */
			g_FP_NEXT_OFFSET = 0;
			
			// Record the function name.
			set_name(function_data, curr_function);
			
			// Function will have its own scope of variables.
			declare_scope(scope_stack);
			
			print_label(curr_function);
			
			if (!is_main(curr_function)) {
				postcall();
			}
		}
		;

ProcedureBody : StatementList RBRACE
		{
			destroy_scope(scope_stack);
			
			// Allow only main to not have a return value.
			if (!is_main(curr_function) && !has_ret_stmt) {
				Cminus_error("Function needs to return a value.");
				exit(-1);
			}
			
			else if (is_main(curr_function) && !has_ret_stmt) {
				issue_exit_imm(0);
			}
			
			free(curr_function);
			curr_function = NULL;
			
			has_ret_stmt = false;
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
			/*
			 * The variable declaration must be in the current scope. In the
			 * case of a global variable, the current scope (the one on top of the
			 * scope stack) is the global scope. In the case of a function variable,
			 * the current scope will be the function's scope.
			 */
			
			// Disallow multiple declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), $1)) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}

			cminus_variable * variable = declare_variable();
			if (variable == NULL) {
				Cminus_compiler_error("Failed to allocate memory for variable struct");
			}

			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), $1);
			free($1);

			int offset = 0;
			if (is_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += 4; // next slot for a 4 byte value.
				variable->global = true;
			}
			
			else {
				g_FP_NEXT_OFFSET -= 4; // no offset can be 0, so must subtract first.
				offset = g_FP_NEXT_OFFSET;
				variable->global = false;
				
				/* Note: Offset from FP will be negative, as stack looks as such:
				 *		        Locals          low addr
				 *		fp -->	Caller's fp		high addr
				 */
			}

			variable->type = identifier_type;
			variable->size = (variable->type == INT) ? CMINUS_INT_SIZE : CMINUS_FLOAT_SIZE;
			variable->offset = offset;
			variable->reg = INVALID;
			
			set_ptr_field(currentSymtab(scope_stack), index, SYMTAB_VARIABLE_FIELD, variable);
		}
		| IDENTIFIER LBRACKET INTCON RBRACKET
		{	
			/*
			 * Array will look as such:
			 * sp --> arr[0]
			 * 		  arr[1]
			 * 		  ...
			 */

			if ($3 <= 0) {
				Cminus_error("Array size cannot be zero or negative.");
				exit(-1);
			}

			// Disallow multiple declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), $1)) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}

			cminus_variable * variable = declare_variable();
			if (variable == NULL) {
				fprintf(stderr, "Failed to allocate memory for variable struct.\n");
				exit(-1);
			}
			
			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), $1);
			free($1);
			
			int offset = 0;
			if (is_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += $3 * 4; // Set offset past the array.
				variable->global = true;
			}
			
			else {
				offset = g_FP_NEXT_OFFSET - $3 * 4; // Start of the array, lower in memory
				g_FP_NEXT_OFFSET = offset; // Set fp offset to start of the array.
				variable->global = false;
			}

			variable->type = (identifier_type == INT ? INT_ARRAY : FLT_ARRAY);
			variable->size = ((variable->type == INT) ? CMINUS_INT_SIZE : CMINUS_FLOAT_SIZE) * $3;
			variable->offset = offset;
			variable->reg = INVALID;

			set_ptr_field(currentSymtab(scope_stack), index, SYMTAB_VARIABLE_FIELD, variable);
		}
		;

Type : INTEGER 
		{ 
			identifier_type = INT;
		}
		| FLOAT
		{
			identifier_type = FLOAT;
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
			// Label else end statement to jump to when the if statement
			// evaluates to true.
			print_else_end_label($2);
			
			DLinkNode * victim_if_node = dlinkPop(&if_stack);
			dlinkFreeNode(victim_if_node);
		}
		| IfToken TestAndThen
		{
			// Prints the label to jump to incase the if statement evaluates to false.
			// An if can have no else statement, thus refer to no else and else as
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
			
			ISSUE_BEQ($2, ZERO, get_if_end_label(if_number));
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
			
			// insert jump to come after the else.
			issue_j(get_else_end_label(if_number));
			
			print_if_end_label(if_number);
		}
		;

WhileStatement : WhileToken WhileExpr Statement
		{	
			// Exiting the while loop, so must remove its number from the stack.
			DLinkNode * victim_while_node = dlinkPop(&while_stack);
			dlinkFreeNode(victim_while_node);
			
			// Insert jump back to the start of the while loop.
			issue_j(get_while_start_label($2));
			
			print_while_end_label($2);
		}
		;

WhileExpr : LPAREN Expr RPAREN
		{			
			// Get the while loop the code is in, which is at the top of the stack.
			DLinkNode * while_node = dlinkHead(&while_stack);
			unsigned long while_number = PTR_AS_ULONG(dlinkNodeAtom(while_node));
			
			// Expr will be the register containing true or false at this point.
			// Test and jump if need be to the end of the while loop.
			ISSUE_BEQ($2, ZERO, get_while_end_label(while_number));
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
				Cminus_compiler_error("Null current function");
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
				issue_exit($2);
			}
			
			reg_free($2);

			has_ret_stmt = true;
		}
		;

ExitStatement : EXIT SEMICOLON
		{
			issue_exit(ZERO);
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
			// TODO MAKE MORE EFFICIENT, BY MANUALLY PERFORMING MATH/EXPLICITY CHANGES WHERE CONSTANT CAN BE USED
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
	
			// Make sure the function exists.
			if (!is_name_defined(function_data, $1)) {
				Cminus_error("Function does not exist.");
				exit(-1);
			}
			
			// Code to set up activation record and jumping to the function.
			precall($1);
			
			free($1);

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
			SymTable scope = variables_scope(scope_stack, $1);
			
			int index = SymQueryIndex(scope, $1);
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			cminus_variable * variable = (cminus_variable *)get_ptr_field(scope, index, SYMTAB_VARIABLE_FIELD);
			if (variable == NULL) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			if (variable->type == INT_ARRAY || variable->type == FLT_ARRAY) {
				Cminus_error("Array identifier needs a specified index.");
				exit(-1);
			}
			
			int offset = variable->offset;
			int base = (is_global_variable(scope_stack, $1) ? GP : FP);
			free($1);
			
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
			
			SymTable scope = variables_scope(scope_stack, $1);
			
			int index = SymQueryIndex(scope, $1);
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			cminus_variable * variable = (cminus_variable *)get_ptr_field(scope, index, SYMTAB_VARIABLE_FIELD);
			if (variable == NULL) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			if (variable->type != INT_ARRAY && variable->type != FLT_ARRAY) {
				Cminus_error("Identifier is not an array.");
				exit(-1);
			}

			int offset = variable->offset; // array start (offset from gp or fp)
			
			ISSUE_SLL($3, $3, 2); // 4 * $Expr
			
			/* 
			 * Calculation of gp offset is as follows: 
			 * array base + (4 * $Expr), where $Expr is the value in the register 
			 * defined by Expr.
			 */
			if (is_global_variable(scope_stack, $1)) {
				ISSUE_ADD($3, $3, GP); // (4 * $Expr) + $GP
				ISSUE_ADDI($3, $3, offset); // $GP + array base offset + (4 * $Expr)
			}
			
			// Local variable, which has an offset from the FP register.
			// Offsets from FP are negative.
			else {
				ISSUE_ADDI($3, $3, offset); // (4 * $Expr) + base
				ISSUE_ADD($3, FP, $3); // FP + (base + (4 * $Expr))
			}

			free($1);
			
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

/******************** C ROUTINES ********************/

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

void 
Cminus_compiler_error(const char * explain) 
{
	fprintf(stderr, "Compiler Error: %s\n", explain);
	exit(-1);
}

int
Cminus_wrap()
{
	return 1;
}

static 
void
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
	sfree(input_no_ext);

	stdout = freopen(output_filename, "w", stdout);
	if (stdout == NULL) {
		fprintf(stderr, "Error: Could not open file %s\n", output_filename);
		exit(-1);
	}
	sfree(output_filename);
	
	scope_stack = symtabStackInit();

	// Declare global scope
	declare_scope(scope_stack);
	
	function_data = SymInit(SYMTABLE_SIZE);
	string_list = SymInit(SYMTABLE_SIZE);
	
	// Initialize the while loop stack to track while loop numbers.
	dlinkListInit(&while_stack, INT_AS_PTR(-1));
	
	// Initialize the if statement stack to track if statement numbers.
	dlinkListInit(&if_stack, INT_AS_PTR(-1));
}

static 
void
cleanup()
{
	symtabStackFree(scope_stack);

	free(curr_function);
	
	SymKill(function_data);
	SymKill(string_list);
	
	// Free memory used by tracking while loops and if statements.
	dlinkFreeNodes(&while_stack);
	dlinkFreeNodes(&if_stack);
	
	fclose(Cminus_in);
	fclose(stdout);
}

static 
void 
print_usage(void)
{
	printf("Usage: cmc [.cm file path]\n");
}

static 
SymTable 
variables_scope(SymtabStack scope_stack, char * var)
{
	if (scope_stack == NULL || var == NULL) {
		Cminus_compiler_error("variables_scope given a null pointer");
	}
	
	bool is_global = is_global_variable(scope_stack, var);
	SymTable scope = (is_global ? lastSymtab(scope_stack) : currentSymtab(scope_stack));

	return scope;
}

inline 
int
get_int_field(SymTable symtab, int index, char * field)
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("get_int_field given a null pointer");
	}
	return PTR_AS_INT(SymGetFieldByIndex(symtab, index, field));
}

inline 
void
set_int_field(SymTable symtab, int index, char * field, int value)
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("set_int_field given a null pointer");
	}
	SymPutFieldByIndex(symtab, index, field, INT_AS_PTR(value));
}

inline 
void 
set_ptr_field(SymTable symtab, int index, char * field, void * value) 
{
	if (symtab == NULL || field == NULL || value == NULL) {
		Cminus_compiler_error("set_ptr_field given a null pointer");
	}
	SymPutFieldByIndex(symtab, index, field, value);
}

inline 
void * 
get_ptr_field(SymTable symtab, int index, char * field) 
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("get_ptr_field given a null pointer");
	}
	return SymGetFieldByIndex(symtab, index, field);
}

static 
void
declare_scope(SymtabStack stack)
{
	if (stack != NULL) {
		SymTable new_scope = beginScope(stack);
		SymInitField(new_scope, SYMTAB_VALUE_FIELD, INT_AS_PTR(-1), NULL);
		SymInitField(new_scope, SYMTAB_VARIABLE_FIELD, NULL, cleanup_variable);
	}
}

static 
void
destroy_scope(SymtabStack stack)
{
	if (stack != NULL && stackSize(stack) > 0) {
		SymTable old_scope = endScope(stack);
		SymKillField(old_scope, SYMTAB_VARIABLE_FIELD);
		SymKillField(old_scope, SYMTAB_VALUE_FIELD);
		SymKill(old_scope);
	}
}

static 
int
get_name_index(SymTable symtab, char * name)
{
	if (symtab == NULL || name == NULL) {
		Cminus_compiler_error("get_name_index given a null pointer");
	}
	
	return SymQueryIndex(symtab, name);
}

static 
int
set_name(SymTable symtab, char * name)
{
	if (symtab == NULL || name == NULL) {
		Cminus_compiler_error("set_name given a null pointer");
	}

	return SymIndex(symtab, name);
}

static 
bool
is_global_variable(SymtabStack stack, char * identifier_name)
{
	bool is_global = false;
	
	if (stack == NULL || identifier_name == NULL) {
		Cminus_compiler_error("is_global_variable given a null pointer");
	}

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

static 
bool
is_name_defined(const SymTable symtab, char * name)
{
	return symtab != NULL && name != NULL && SymQueryIndex(symtab, name) != SYM_INVALID_INDEX;
}

static inline 
bool
is_scope_global(SymtabStack scope_stack)
{
	return scope_stack != NULL && stackSize(scope_stack) == 1;
}

static inline 
bool
is_main(const char * function_name)
{
	return function_name != NULL && strcmp(function_name, "main") == 0;
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
	
	print_prologue();

	Cminus_parse();

	print_epilogue(SYMTAB_VALUE_FIELD);
  
	cleanup();
  
	return 0;
}

/******************END OF C ROUTINES**********************/
