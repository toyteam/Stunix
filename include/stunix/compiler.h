#ifndef STUNIX_COMPILER_H
#error "Please don't include <compiler-gcc.h> directly, include <ompiler.h> instead."
#endif

#ifndef STUNIX_COMPILER_H
#define STUNIX_COMPILER_H


#ifdef __GNUC__
#include <stunix/compiler-gcc.h>
#endif
/*
* If gcc is too old to support 'inline', define inline.
*/
//TODO




#endif