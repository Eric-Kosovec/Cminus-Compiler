/*
 * regs_mgmt.c
 *
 * Defines methods to issue MIPS instructions.
 * 
 * to compile:
 *  make
 *
 * Modified by Eric Kosovec
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <util/general.h>
#include <util/symtab.h>
#include <util/symtab_stack.h>
#include <util/dlink.h>
#include <util/string_utils.h>
#include "mips_mgmt.h"
#include "typesystem.h"

EXTERN(char *, get_str_value, (SymTable, int));
EXTERN(int, set_value, (SymTable, int, int));
EXTERN(int, set_str_value, (SymTable, int, char *));

extern SymTable function_data;
extern SymTable string_list;

int   			g_STRING_INDEX   = 0;
int   			g_GP_NEXT_OFFSET = 0;
int   			g_FP_NEXT_OFFSET = 0;
unsigned long   g_NEXT_WHILE_ID = 0;
unsigned long	g_NEXT_IF_ID = 0;

#ifdef TEST_ME
#define PRINTF(...) printf(__VA_ARGS__)
#define PUTS(str) puts(str)
#else
#define PRINTF(...)
#define PUTS(str)
#endif

register_file_t g_RF = {
	{
/* 
 * Register names and availability initialization.
 * Only registers t0-t9 and s0-s7 are initially free.
 * Other registers are reserved for specific use.
 * Note: doesn't mean registers can never be used;
 * they just need to be used in a specific context.
 */
// 	Read-only", returns 0
		{ "zero",	false	},	
// 	Reserved for assembler
		{ "at",		false	},	
// 	Holds syscall values and expression values
		{ "v0",		false	},
		{ "v1",		false	},
// 	Function calls args
		{ "a0",		false	}, 
		{ "a1",		false	}, 
		{ "a2",		false	}, 
		{ "a3",		false	},
// 	Temporaries
		{ "t0",		true	}, 
		{ "t1",		true	}, 
		{ "t2",		true	}, 
		{ "t3",		true	}, 
		{ "t4",		true	}, 
		{ "t5",		true	},
		{ "t6",		true	},
		{ "t7",		true	},
// 	Preserved
		{ "s0",		true	}, 
		{ "s1",		true	}, 
		{ "s2",		true	},
		{ "s3",		true	},
		{ "s4",		true	}, 
		{ "s5",		true	}, 
		{ "s6",		true	}, 
		{ "s7",		true	},
// 	More temporaries
		{ "t8",		true	}, 
		{ "t9",		true	},
// 	Reserverd for OS Kernel
		{ "k0",		false	}, 
		{ "k1",		false	},
// 	Global pointer
		{ "gp",		false	},
// 	Frame pointer
		{ "fp",		false	}, 
// 	Stack pointer
		{ "sp",		false	},
// 	Return address
		{ "ra",		false	}	
	},
/* 
 * Number of free registers equals 
 * the number of regs which *can* be free
 */
	T9-T0,
/* 
 * Index of latest free register 
 */
	T0 
};

/*
 * Allocates a new register from the list of free registers.
 * Note: complexity is O(n), but the number of potentially free registers 
 * is very small (18), and (1) we start by checking if there is ANY free
 * register available, (2) we start from the latest place we found a free
 * register: hopefully this means we minimize the search time (not necessarily
 * true due to "fragmentation" of indices).
 */
reg_idx_t 
reg_alloc()
{
//	Should never happen in our context. WILL happen in more realistic ones!
	assert(g_RF.n_free > 0 && "no more registers available!"); 

//	Start where we left. 
	reg_idx_t i = g_RF.latest_free;
	do {
		if (REG_FREE(i)) {
			g_RF.latest_free = i;
			REG_FREE(i) = false;
			--g_RF.n_free;
			return i;
		}
// Reach end of regs which can be free? Then wrap to first reg which can be free 
		if (++i > T9) {
			i = T0;
		}
	}  while (i != g_RF.latest_free);

	return INVALID; // we should never get here.
}

/* 
 * Frees a register
 */
void
reg_free(reg_idx_t reg) 
{
	if (reg < T0 || reg > T9) {
		return;
	}
	
	if (!REG_FREE(reg)) {
		REG_FREE(reg) = true;
		++g_RF.n_free;
	}
}

/*
 * Issues the MIPS code sequence to print a new line on the standard output
 */
void 
write_new_line() 
{
	PUTS("#\tprint new line");
	puts("\tla $a0, .newline");
	puts("\tli $v0, 4");
	puts("\tsyscall");
}

/*
 * Issues the MIPS code sequence to load and print a constant integer
 */
void
write_const_int(int value)
{
	PUTS("#\tprint constant value");
	printf("\tli $a0, %d\n", value);
	puts("\tli $v0, 1");
	puts("\tsyscall");
}

/*
 * Issues the MIPS code sequence to print the (integer) content of a register
 */
void 
write_reg_value(reg_idx_t reg) 
{
	PUTS("#\tprint register content");
	printf("\tmove $a0, $%s\n", REG_NAME(reg));
	puts("\tli $v0, 1");
	puts("\tsyscall");
}

/*
 * Issues the MIPS code sequence to print a constant string whose address 
 * is contained in register <reg>.
 */
void 
write_const_string(const char * str_label) 
{
	PUTS("#\tprint constant string");
	issue_la(A0, str_label);
	puts("\tli $v0, 4");
	puts("\tsyscall");
}

/*
 * Issues the MIPS code sequence to read an int into register <reg>.
 */
void
read_int(reg_idx_t var_locale)
{
	PRINTF("#\t%s = <stdin>\n");
	puts("\tli $v0, 5");
	puts("\tsyscall");
	issue_sw(V0, var_locale, 0);
}

/*
 * Issues a register-to-register arithmetic or logic operation
 * <op> contains a string to the actual instruction name
 * <dst> holds the final result
 * <src1> is the register which holds the 1st operand
 * <src2> is the register which holds the 2nd operand
 */
void
issue_op(const char * op, reg_idx_t dst, reg_idx_t src1, reg_idx_t src2) 
{
	PRINTF("#\t%s = %s (%s,%s)\n", 
		REG_NAME(dst), op, REG_NAME(src1), REG_NAME(src2));
	printf("\t%s $%s, $%s, $%s\n", 
		op, REG_NAME(dst), REG_NAME(src1), REG_NAME(src2));
}

/*
 * Issues an arithmetic or logic operation with 
 * one register and one immediate as operands
 * <op> contains a string to the actual instruction name
 * <dst> holds the final result
 * <src> is the register which holds the reg value
 * <value> is the constant integer to use for 2nd operand
 */
void 
issue_op_imm(const char * op, reg_idx_t dst, reg_idx_t src, int value)
{
	PRINTF("#\t%s = %s (%s %d)\n", 
		REG_NAME(dst), op, REG_NAME(src), value);
	printf("\t%si $%s, $%s, %d\n", op, REG_NAME(dst), REG_NAME(src), value);
}

/*
 * Issues an operation with 
 * two registers and one label.
 * <op> contains a string to the actual instruction name
 * <src1> register containing the value for the first operand
 * <src2> register containing the value for the second operand
 * <label> label to use to the last operand.
 */
void 
issue_op_label(const char * op, reg_idx_t src1, reg_idx_t src2, char * label) 
{
	printf("\t%s $%s, $%s, %s\n", op, REG_NAME(src1), REG_NAME(src2), label);
}

/*
 * Issues a jump instruction to a given label.
 * <label> label to jump to
 */
void 
issue_j(const char * label) 
{
	printf("\tj %s\n", label);
}

/*
 * Issues a jump and link instruction to a given label.
 * <label> label to jump to
 */
void 
issue_jal(const char * label) 
{
	printf("\tjal %s\n", label);
}

/*
 * Issues a jump register instruction to jump to the address contained in the register.
 * <src> register containing address to jump to
 */
void 
issue_jr(reg_idx_t src) 
{
	printf("\tjr $%s\n", REG_NAME(src));
}

/*
 * Issues an sll instruction
 * <dst> holds the final result
 * <src> is the register which holds the reg value
 * <shamt> amount to shift by
 */
void 
issue_op_shift(const char * op, reg_idx_t dst, reg_idx_t src, int shamt) 
{
	printf("\t%s $%s, $%s, %d\n", op, REG_NAME(dst), REG_NAME(src), shamt);
}

/*
 * Issues a load-word operation.
 * 	Synopsis: <dst> = *(<base> + <offset>);
 * <dst> holds the final result
 * <base> contains the base address where the word is stored. 
 * 	<base> can be one of $fp, $sp, or $gp
 * <offset> where to locate the word to load, starting from <base>
 */
void
issue_lw(reg_idx_t dst, reg_idx_t base, int offset)
{
	PRINTF("#\t%s = %s[%d]\n", REG_NAME(dst), REG_NAME(base), offset);
	printf("\tlw $%s, %d($%s)\n", REG_NAME(dst), offset, REG_NAME(base));
}

/*
 * Issues a store-word operation.
 * 	Synopsis: *(<base> + <offset>) = <src>;
 * <src> register which holds the value to write.
 * <base> contains the base address where the word is stored. 
 * 	<base> can be one of $fp, $sp, or $gp
 * <offset> where to locate the word to load, starting from <base>
 */
void
issue_sw(reg_idx_t src, reg_idx_t base, int offset)
{
	PRINTF("#\t%s[%d] = %s\n", REG_NAME(base), offset, REG_NAME(src));
	printf("\tsw $%s, %d($%s)\n", REG_NAME(src), offset, REG_NAME(base));
}

/*
 * Issues a load-immediate (<dst> = <value>)
 * <dst> register which will hold the value
 * <value> immediate value to load
 */
void
issue_li(reg_idx_t dst, int value)
{
	PRINTF("#\t%s = %d\n", REG_NAME(dst), value);
	printf("\tli $%s, %d\n", REG_NAME(dst), value);
}

/*
 * Issues a move instruction.
 *
 * Params:
 * 	dst - Destination register
 *		src - Source register
 */
void 
issue_move(reg_idx_t dst, reg_idx_t src) 
{
	printf("\tmove $%s, $%s\n", REG_NAME(dst), REG_NAME(src));
}

/*
 * Issues a load-address (<dst> = <address>)
 * <dst> register which will hold the value
 * <address> immediate value to load
 */
void
issue_la(reg_idx_t dst, const char* str)
{
	PRINTF("#\t%s = %s\n", REG_NAME(dst), str);
	printf("\tla $%s, %s\n", REG_NAME(dst), str);
}

/*
 * Pushes a given register onto the stack.
 *
 * Params:
 * 	src - Register to place on the stack.
 */
void 
push_stack(reg_idx_t src) 
{
	ISSUE_ADDI(SP, SP, -4);
	issue_sw(src, SP, 0);
}

/*
 * Pops a value off the stack into the given register.
 *
 * Params:
 * 	dst - Register to place stack value into.
 */
void 
pop_stack(reg_idx_t dst) 
{
	issue_lw(dst, SP, 0);
	ISSUE_ADDI(SP, SP, 4);
}

/*
 * Activation record will look like:
 *
 *		Locals				(low addr)
 *		Caller's fp
 *		ra
 *		s-regs
 *		t-regs				(high addr)
 *
 *	With stack growth going towards the lower addresses.
 */

/*
 * Sets up the activation record for before a function call. Saves 
 * temporary registers and the frame pointer on the stack.
 *
 * Params:
 * 	function_name - Function that is being called.
 */
void 
precall(const char * function_name) 
{
	reg_idx_t reg;
	
	if (function_name == NULL) {
		fprintf(stderr, "Precall null argument given. Compiler bug.\n");
		exit(-1);
	}
	
	for (reg = T0; reg <= T9; ++reg) {
		// Place in-use temporary registers on the stack.
		if ((reg < S0 || reg > S7) && REG_FREE(reg) == false) {
			push_stack(reg);
		}
	}
	
	// Point to right before fp section.
	ISSUE_ADDI(SP, SP, -36);
	
	// Save caller's fp.
	push_stack(FP);
	
	// Change fp to point to fp section.
	issue_move(FP, SP);
	
	issue_jal(function_name);
}

/*
 * Sets up the activation record for immediately after jumping to a function. Saves 
 * saved registers and return address on the stack.
 */
void 
postcall() 
{
	reg_idx_t reg;
	
	// sp will be at fp section.
	
	ISSUE_ADDI(SP, SP, 8);
	
	// Save return address
	push_stack(RA);
	
	// Move sp to before saved register section.
	ISSUE_ADDI(SP, SP, 36);
	
	for (reg = S0; reg <= S7; ++reg) {
		push_stack(reg);
	}
	
	// sp now at s7
	
	// Point to fp section.
	issue_move(SP, FP);
	
	// Locals can now be pushed onto stack.
	// Fall through to code.
}

/*
 * Clears up the activation record before returning from a function. Restores 
 * saved registers and the frame pointer from the stack.  Also, jumps back to the 
 * caller.
 */
void 
prereturn() 
{
	reg_idx_t reg;
	
	// sp will be at the last local data element.
	
	// Discard all local data.
	issue_move(SP, FP);
	
	// Restore caller's fp.
	pop_stack(FP);
	
	// Restore ra value.
	pop_stack(RA);
	
	for (reg = S7; reg >= S0; --reg) {
		pop_stack(reg);
	}
	
	// sp now at end of temporary registers.
	
	// Jump back to caller.
	issue_jr(RA);
}

/*
 * Clears up the activation record after returning to the caller function after a function call. Restores 
 * temporary registers from the stack.
 */
void 
postreturn() 
{
	reg_idx_t reg;
	
	// sp points to end of t-registers
	
	for (reg = T9; reg >= T0; --reg) {
		if ((reg < S0 || reg > S7) && REG_FREE(reg) == false) {
			pop_stack(reg);
		}
	}
	
	// sp now points to before where the ar was created.
}

/*
 * Print the function label before its code.
 *
 * Params:
 * 	function_name - Name of the function to use as a label.
 */
void 
print_function_label(const char * function_name) 
{
	printf("%s:\n", function_name);
}

/*
 * Print the label that goes after the if code.
 *
 * Params:
 * 	while_id - Id of the while loop start.
 */
void 
print_while_start_label(unsigned long while_id) 
{
	printf("__whlbgn%lu:\n", while_id);
}

char *
get_while_start_label(unsigned long while_id)
{
	// Will never exceed 32 characters.
	char * while_start_label = (char *)malloc(sizeof(char) * 32);
	if (while_start_label == NULL) {
		return NULL;
	}
	memset(while_start_label, 0, sizeof(char) * 32);
	sprintf(while_start_label, "__whlbgn%lu", while_id);
	return while_start_label;
}

/*
 * Print the label that goes after the while loop code.
 *
 * Params:
 * 	while_id - Id of the while loop to use.
 */
void 
print_while_end_label(unsigned long while_id) 
{
	printf("__whlend%lu:\n", while_id);
}

char *
get_while_end_label(unsigned long while_id)
{
	// Will never exceed 32 characters.
	char * while_end_label = (char *)malloc(sizeof(char) * 32);
	if (while_end_label == NULL) {
		return NULL;
	}
	memset(while_end_label, 0, sizeof(char) * 32);
	sprintf(while_end_label, "__whlend%lu", while_id);
	return while_end_label;
}

/*
 * Print the label that goes after the if code.
 *
 * Params:
 * 	if_id - Id of the if statement to use.
 */
void 
print_if_end_label(unsigned long if_id) 
{
	printf("__ifend%lu:\n", if_id);
}

char *
get_if_end_label(unsigned long if_id)
{
	// Will never exceed 32 characters.
	char * if_end_label = (char *)malloc(sizeof(char) * 32);
	if (if_end_label == NULL) {
		return NULL;
	}
	memset(if_end_label, 0, sizeof(char) * 32);
	sprintf(if_end_label, "__ifend%lu", if_id);
	return if_end_label;
}

/*
 * Print the label that goes after the else code.
 *
 * Params:
 * 	if_id - Id of the if statement the else is associated with.
 */
void 
print_after_else_label(unsigned long if_id) 
{
	printf("__aftr_else%lu:\n", if_id);
}

char *
get_after_else_label(unsigned long if_id)
{
	// Will never exceed 32 characters.
	char * after_end_label = (char *)malloc(sizeof(char) * 33);
	if (after_end_label == NULL) {
		return NULL;
	}
	memset(after_end_label, 0, sizeof(char) * 33);
	sprintf(after_end_label, "__aftr_else%lu", if_id);
	return after_end_label;
}

void 
print_rf_state()
{
#ifdef TEST_ME
	printf("Register names and status:\n");
	for (reg_idx_t i = INVALID + 1; i < N_MIPS_REGS; ++i) {
		printf("%s is %s\n", REG_NAME(i), REG_FREE(i) ? "free" : "busy");
	}
#endif
}

void
print_prolog() 
{
	PUTS("# prolog");
	puts(".data");
	puts(".newline: .asciiz \"\\n\"");
	puts(".text");
	puts(".globl main");
	puts("\tj main");
}

void
print_epilog(reg_idx_t ret_val)
{
	PUTS("#\texit()ing the program");
	puts("\tli $v0, 17");
	printf("\tmove $a0, $%s\n", REG_NAME(ret_val));
	puts("\tsyscall");
}

/*
 * Prints all the strings that were found during the parse, one after the other
 * all string keys start with __str (which is not in the namespace of the Cminus language)
 */
void
print_string_labels()
{
	// No strings in the code.
	if (g_STRING_INDEX <= 0) {
		return;
	}
	
	int i;
	char string[16]; // we should never go beyond 16 characters for a string index...
	printf(".data\n");
	for (i = 0 ; i < g_STRING_INDEX; ++i) {
		memset(string, 0, sizeof(string));
		sprintf(string, "__str%d", i);
		printf("%s: .asciiz \"%s\"\n", string, get_str_value(string_list, SymIndex(string_list, string)));
	}
}

