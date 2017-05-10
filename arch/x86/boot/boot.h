#ifndef BOOT_BOOT_H
#define BOOT_BOOT_H

static inline u16 ds(void)
{
	u16 seg;
	asm("movw %%ds,%0" : "=rm" (seg));
	return seg;
}




#endif