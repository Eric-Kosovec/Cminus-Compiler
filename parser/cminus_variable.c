#include <stdlib.h>

#include <util/general.h>

#include "cminus_variable.h"

cminus_variable_t *
cminus_var_create(cminus_type_t type)
{
	cminus_variable_t * cvar = (cminus_variable_t *)malloc(sizeof(cminus_variable_t));
	
	if (cvar != NULL) {
		cminus_var_init(cvar, type);
	}
	
	return cvar;
}

void
cminus_var_init(cminus_variable_t * cvar, cminus_type_t type)
{
	if (cvar != NULL) {
		cvar->identifier = NULL;
		cvar->type = type;
		cvar->is_constant = false;
		cvar->reg_idx = -1;
		cvar->mem_offset = -1;
		cvar->value.ival = 0;
		cvar->is_array = false;
		cvar->length = 1;
		cvar->bytes = CMINUS_SIZEOF(type);
	}
}

void
cminus_var_destroy()
{
	return;
}

/*
 * typedef struct {
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
 *
 *
 */

void
cminus_var_set_arraydata(cminus_variable_t * cvar, cminus_type_t type, int length)
{
	if (cvar != NULL && length > 0) {
		cvar->is_array = true;
		cvar->length = length;
		cvar->type = type;
		cvar->bytes = CMINUS_SIZEOF(type) * length;
	}
}

void
cminus_var_set_memoffset(cminus_variable_t * cvar, int offset)
{
	if (cvar != NULL) {
		cvar->mem_offset = offset;
	}
}

void
cminus_var_set_identifier(cminus_variable_t * cvar, char * identifier)
{
	if (cvar != NULL && identifier != NULL) {
		cvar->identifier = identifier;
	}
}
