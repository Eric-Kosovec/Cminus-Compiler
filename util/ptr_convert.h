#ifndef PTR_CONVERT_H
#define PTR_CONVERT_H

#define INT_AS_PTR(I) ((void *)((long)(I)))
#define PTR_AS_INT(P) ((int)((long)(P)))

#define LONG_AS_PTR(L) ((void *)(L))
#define PTR_AS_LONG(P) ((long)(P))

#define ULONG_AS_PTR(L) ((void *)(L))
#define PTR_AS_ULONG(P) ((unsigned long)(P))

#endif