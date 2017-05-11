#ifndef STUNIX_IRQFLAGS_H
#define STUNIX_IRQFLAGS_H


#include <asm/irqflags.h>

#define local_irq_enable()	do { raw_local_irq_enable(); } while (0)
#define local_irq_disable()	do { raw_local_irq_disable(); } while (0)



#endif