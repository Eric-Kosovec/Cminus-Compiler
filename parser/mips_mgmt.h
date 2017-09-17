#ifndef MIPS_MGMT_H_GUARD
#define MIPS_MGMT_H_GUARD

#ifndef bool
#define true 1
#define false 0
#endif

typedef enum mips_idx_e {
	INVALID	= -1,
	ZERO	= 0,			// read-only, returns 0
	AT,				// reserved for assembler
	V0, V1,				// holds syscall values and expression values
	A0, A1, A2, A3, 		// syscall args
	T0, T1, T2, T3, T4, T5, T6, T7,	// temporaries
	S0, S1, S2, S3, S4, S5, S6, S7,	// preserved
	T8, T9, 			// more temporaries
	K0, K1, 			// reserved for OS kernel
	GP, 				// Global pointer
	FP, SP, 			// frame and stack pointers
	RA,				// return address
	N_MIPS_REGS			// number of MIPS registers
} reg_idx_t;

#if 0
char reg_names[N_MIPS_REGS][5] {
	"ZERO",						// read-only", returns 0
	"AT",						// reserved for assembler
	"V0", "V1",					// holds syscall values and expression values
	"A0", "A1", "A2", "A3", 			// syscall args
	"T0", "T1", "T2", "T3", "T4", "T5", "T6", "T7",	// temporaries
	"S0", "S1", "S2", "S3", "S4", "S5", "S6", "S7",	// preserved
	"T8", "T9", 					// more temporaries
	"K0", "K1", 					// reserved for OS kernel
	"GP", 						// Global pointer
	"FP", "SP", 					// frame and stack pointers
	"RA",						// return address
};
#endif 

typedef struct reg_s {
	char * name;
	int	is_free;
} reg_t;

typedef struct register_file_s {
	reg_t registers[N_MIPS_REGS];	// name and availability of registers
	int	n_free;						// how many free regs are left
	int latest_free;				// index of latest free reg available
} register_file_t;

extern register_file_t	g_RF;
extern int g_GP_NEXT_OFFSET;
extern int g_FP_NEXT_OFFSET;
extern int g_STRING_INDEX;
extern unsigned long g_NEXT_WHILE_ID;
extern unsigned long g_NEXT_IF_ID;

void 		print_function_label(const char * function_name);
void		print_while_start_label	(unsigned long while_id);
char *		get_while_start_label	(unsigned long while_id);
void		print_while_end_label	(unsigned long while_id);
char * 		get_while_end_label	(unsigned long while_id);
void		print_if_end_label	(unsigned long if_id);
char *		get_if_end_label	(unsigned long if_id);
void		print_after_else_label	(unsigned long if_id);
char *	get_after_else_label	(unsigned long if_id);
void      print_prolog          ();
void      print_epilog          (reg_idx_t ret_val);
void      print_string_labels   ();
reg_idx_t reg_alloc             ();
void      reg_free              (reg_idx_t   reg);
void      write_new_line        ();
void      read_int              (reg_idx_t   var_locale);
void      write_const_int       (int         value);
void      write_reg_value       (reg_idx_t   reg);
void      write_const_string    (const char * str_label);
void      issue_op              (const char * op,  reg_idx_t dst,  reg_idx_t src1, reg_idx_t src2);
void      issue_op_imm          (const char * op,  reg_idx_t dst,  reg_idx_t src,  int value);
void		issue_op_label	(const char * op, reg_idx_t src1, reg_idx_t src2, char * label);
void	issue_op_shift	(const char * op, reg_idx_t dst, reg_idx_t src, int shamt);
void		issue_j	(const char * label);
void 		issue_jal	(const char * label);
void		issue_jr	(reg_idx_t src);
void      issue_lw              (reg_idx_t   dst, reg_idx_t base, int offset);
void      issue_sw              (reg_idx_t   src, reg_idx_t base, int offset);
void      issue_li              (reg_idx_t   dst, int offset);
void		issue_move	(reg_idx_t dst, reg_idx_t src);
void      issue_la              (reg_idx_t   dst, const char* str_label);
void		push_stack	(reg_idx_t src);
void		pop_stack	(reg_idx_t dst);
void		precall	(const char * function_name);
void		postcall	();
void		prereturn	();
void		postreturn	();

#define REG_NAME(idx) g_RF.registers[(idx)].name
#define REG_FREE(idx) g_RF.registers[(idx)].is_free

#define ISSUE_ADD(dst, src1, src2)	do { issue_op("add", (dst), (src1), (src2)); } while (0)
#define ISSUE_SUB(dst, src1, src2)	do { issue_op("sub", (dst), (src1), (src2)); } while (0)
#define ISSUE_MUL(dst, src1, src2)	do { issue_op("mul", (dst), (src1), (src2)); } while (0)
#define ISSUE_DIV(dst, src1, src2)	do { issue_op("div", (dst), (src1), (src2)); } while (0)
#define ISSUE_XOR(dst, src1, src2)	do { issue_op("xor", (dst), (src1), (src2)); } while (0)
#define ISSUE_OR(dst,  src1, src2)	do { issue_op("or", (dst), (src1), (src2));  } while (0)
#define ISSUE_AND(dst, src1, src2)	do { issue_op("and", (dst), (src1), (src2)); } while (0)
#define ISSUE_SGT(dst, src1, src2)  do { issue_op("sgt", (dst), (src1), (src2)); } while (0)
#define ISSUE_SGE(dst, src1, src2)  do { issue_op("sge", (dst), (src1), (src2)); } while (0)
#define ISSUE_SLT(dst, src1, src2)  do { issue_op("slt", (dst), (src1), (src2)); } while (0)
#define ISSUE_SLE(dst, src1, src2)  do { issue_op("sle", (dst), (src1), (src2)); } while (0)
#define ISSUE_SNE(dst, src1, src2)  do { issue_op("sne", (dst), (src1), (src2)); } while (0)
#define ISSUE_SEQ(dst, src1, src2)  do { issue_op("seq", (dst), (src1), (src2)); } while (0)
#define ISSUE_BEQ(src1, src2, dst)  do { issue_op_label("beq", (src1), (src2), (dst)); } while (0)

#define ISSUE_ADDI(dst, src1, src2)	do { issue_op_imm("add", (dst), (src1), (src2)); } while (0)
#define ISSUE_SUBI(dst, src1, src2)	do { issue_op_imm("sub", (dst), (src1), (src2)); } while (0)
#define ISSUE_MULI(dst, src1, src2)	do { issue_op_imm("mul", (dst), (src1), (src2)); } while (0)
#define ISSUE_DIVI(dst, src1, src2)	do { issue_op_imm("div", (dst), (src1), (src2)); } while (0)
#define ISSUE_XORI(dst, src1, src2)	do { issue_op_imm("xor", (dst), (src1), (src2)); } while (0)
#define ISSUE_ORI(dst,  src1, src2)	do { issue_op_imm("or", (dst), (src1), (src2));  } while (0)
#define ISSUE_ANDI(dst, src1, src2)	do { issue_op_imm("and", (dst), (src1), (src2)); } while (0)

#define ISSUE_SLL(dst, src, shamt) do { issue_op_shift("sll", (dst), (src), (shamt)); } while (0)

#endif	// MIPS_MGMT_H_GUARD
