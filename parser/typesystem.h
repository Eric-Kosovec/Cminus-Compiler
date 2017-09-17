/*
 * typesystem.h
 *
 * Definitions for the Cminus type system.
 *
 * Written by Eric Kosovec
 */

#ifndef CMINUS_TYPES_H
#define CMINUS_TYPES_H

#define CMINUS_TYPE_SIZEOF(x)

#define CMINUS_INT_SIZE 4

#include <sys/types.h>

// Defines the types of Cminus.
typedef enum {
	INT, 
	FLT, 
	INT_ARRAY, 
	FLT_ARRAY, 
	INVALID_TYPE
} data_type;

// Metadata for data used in Cminus.
typedef struct {
	data_type type;
	size_t bytes;
} type_metadata;

/*
 * Creates a structure to store type metadata for a variable.
 * 
 * Returns Malloc'd type metadata structure.
 */
type_metadata * type_metadata_create();

/*
 * Initializes a type meta data structure with the given 
 * type and amount of bytes.
 *
 * Params:
 * 	meta - Type metadata structure to initialize.
 *		type - The type of the variable.
 *		bytes - The amount of bytes the variable takes up.
 */
void type_metadata_init(type_metadata * meta, data_type type, size_t bytes);

/*
 * Destroys a type meta data structure.
 *
 * Params:
 * 	meta - Type metadata structure to destroy.
 */
void type_metadata_destroy(type_metadata * meta);

/*
 * Gets the type within the metadata structure.
 *
 * Params:
 * 	meta - Type metadata structure to get type from.
 *
 * Returns The type stored in the metadata structure.
 */
data_type type_metadata_get_type(type_metadata * meta);

/*
 * Gets the amount of bytes within the metadata structure.
 *
 * Params:
 * 	meta - Type metadata structure to get the bytes from.
 *
 * Returns The amount of bytes stored in the metadata structure.
 */
size_t type_metadata_get_bytes(type_metadata * meta);

#endif