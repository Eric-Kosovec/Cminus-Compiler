#ifndef CMINUS_VARIABLE_H
#define CMINUS_VARIABLE_H

#define CMINUS_INT_SIZE 4
#define CMINUS_FLOAT_SIZE 4

typedef enum cminus_type_e {
	CMINUS_INT = CMINUS_INT_SIZE,
	CMINUS_FLOAT = CMINUS_FLOAT_SIZE
} cminus_type_t;

typedef struct {
	char * identifier;
	cminus_type_t type;
	bool is_constant;
	int reg_idx;
	int mem_offset;
	union {
		int ival;
		float fval;
	} value;
	bool is_array;
	unsigned int length;
	unsigned int bytes;
} cminus_variable_t;

#define CMINUS_SIZEOF(V) ((int)(V))

cminus_variable_t * cminus_var_create(cminus_type_t type);
void cminus_var_init(cminus_variable_t * cvar, cminus_type_t type);
void cminus_var_set_arraydata(cminus_variable_t * cvar, cminus_type_t type, int length);
void cminus_var_set_memoffset(cminus_variable_t * cvar, int offset);
void cminus_var_set_identifier(cminus_variable_t * cvar, char * identifier);

#endif
