
#include<stdarg.h>


int printk(const char *fmt, ...)
{
	va_list args;
	int r;

	va_start(args, fmt);
	r = vprintk_func(fmt, args);
	va_end(args);

	return r;
}

int vprintk_default(const char *fmt, va_list args)
{
	int r;
	r = vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);
	return r;
}


