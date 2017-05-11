#ifndef STUNIX_STACKPROTECTOR_H
#define STUNIX_STACKPROTECTOR_H


#ifdef CONFIG_CC_STACKPROTECTOR
# include <asm/stackprotector.h>
#else
static inline void boot_init_stack_canary(void)
{
}
#endif


#endif