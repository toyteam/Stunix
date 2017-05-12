
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

#ifdef CONFIG_KGDB_KDB
	if (unlikely(kdb_trap_printk)) {
		r = vkdb_printf(KDB_MSGSRC_PRINTK, fmt, args);
		return r;
	}
#endif
	r = vprintk_emit(0, LOGLEVEL_DEFAULT, NULL, 0, fmt, args);

	return r;
}


