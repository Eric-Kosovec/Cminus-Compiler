/*
 * typesystem.h
 *
 * Definitions for the Cminus type system.
 *
 * Written by Eric Kosovec
 */

#ifndef TYPE_SYSTEM_H
#define TYPE_SYSTEM_H

// Size of variable
#define CMINUS_SIZEOF(v) ((v) == NULL ? 0 : (v)->size)

#define CMINUS_INT_SIZE 4
#define CMINUS_FLOAT_SIZE 4

#include <sys/types.h>
#include <stdbool.h>

#include "mips_mgmt.h"

// Defines the types of Cminus.
typedef enum {
	INT, 
	FLT, 
	INT_ARRAY, 
	FLT_ARRAY, 
	INVALID_TYPE = -1
} cminus_type_t;

typedef struct {
	bool global; // Indicate if offset is relative to FP or GP, local or global, respectively.
	size_t size; // Size in bytes of the variable.
	cminus_type_t type; // Type of the variable.
	int offset; // Offset variable is located from the FP or GP.
	reg_idx_t reg; // Register the variable is in, if any.
} cminus_variable;

cminus_variable * declare_variable(void);

void cleanup_variable(void * var);

void variable_init(cminus_variable * var, bool global, size_t size, cminus_type_t type, int offset, reg_idx_t reg);

#endif