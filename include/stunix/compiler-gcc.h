#ifndef STUNIX_COMPILER_GCC_H
#define STUNIX_COMPILER_GCC_H

/*
* inline optimization test and define
*/
#if !defined(CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING) ||		\
    !defined(CONFIG_OPTIMIZE_INLINING) || (__GNUC__ < 4)
#define inline		inline		__attribute__((always_inline))
#define __inline__	__inline__	__attribute__((always_inline))
#define __inline	__inline	__attribute__((always_inline))
#else
#define inline		inline
#define __inline__	__inline__
#define __inline	__inline
#endif


#define __aligned(x)		__attribute__((aligned(x)))
#define __printf(a, b)		__attribute__((format(printf, a, b)))
#define __scanf(a, b)		__attribute__((format(scanf, a, b)))
#define __attribute_const__	__attribute__((__const__))
#define __maybe_unused		__attribute__((unused))
#define __always_unused		__attribute__((unused))

#endif