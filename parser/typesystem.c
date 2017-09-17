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

#include "typesystem.h"

#include <sys/types.h>
#include <stdlib.h>

/*
 * Creates a structure to store type metadata for a variable.
 * 
 * Returns Malloc'd type metadata structure.
 */
type_metadata * type_metadata_create() {	
	return (type_metadata *)malloc(sizeof(type_metadata));
}

/*
 * Initializes a type meta data structure with the given 
 * type and amount of bytes.
 *
 * Params:
 * 	meta - Type metadata structure to initialize.
 *		type - The type of the variable.
 *		bytes - The amount of bytes the variable takes up.
 */
void type_metadata_init(type_metadata * meta, data_type type, size_t bytes) {
	if (meta != NULL && bytes >= 0) {
		meta->type = type;
		meta->bytes = bytes;
	}
}

/*
 * Destroys a type meta data structure.
 *
 * Params:
 * 	meta - Type metadata structure to destroy.
 */
void type_metadata_destroy(type_metadata * meta) {
	free(meta);
}

/*
 * Gets the type within the metadata structure.
 *
 * Params:
 * 	meta - Type metadata structure to get type from.
 *
 * Returns The type stored in the metadata structure.
 */
data_type type_metadata_get_type(type_metadata * meta) {
	if (meta == NULL) {
		return INVALID_TYPE;
	}
	
	return meta->type;
}

/*
 * Gets the amount of bytes within the metadata structure.
 *
 * Params:
 * 	meta - Type metadata structure to get the bytes from.
 *
 * Returns The amount of bytes stored in the metadata structure.
 */
size_t type_metadata_get_bytes(type_metadata * meta) {
	if (meta == NULL) {
		return -1;
	}
	
	return meta->bytes;
}
