/*
 * Typesystem
 *
 * The Cminus Type System. 
 * Implementation of methods to use to track variable types 
 * and sizes. This includes float, int, int array, float array, and string.
 * 
 * to compile:
 *  make
 *
 * Written by Eric Kosovec
 */

#include "type_system.h"
#include "mips_mgmt.h"

#include <sys/types.h>
#include <stdlib.h>

cminus_variable * 
declare_variable(void) 
{
	cminus_variable * new_var = (cminus_variable *)malloc(sizeof(cminus_variable));
	if (new_var != NULL) {
		variable_init(new_var, false, 0, INVALID_TYPE, 0, INVALID);
	}

	return new_var;
}

void 
cleanup_variable(void * var) 
{
	if (var != NULL) {
		free(var);
	}
}

void 
variable_init(cminus_variable * var, bool global, size_t size, cminus_type_t type, int offset, reg_idx_t reg) 
{
	if (var != NULL) {
		var->global = global;
		var->size = size;
		var->type = type;
		var->offset = offset;
		var->reg = reg;
	}
}

