#ifndef KERNEL_PRINTK_INTERNAL_H
#define KERNEL_PRINTK_INTERNAL_H

#include<stunix/compiler.h>


static inline __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
{
	return vprintk_default(fmt, args);
}

#endif