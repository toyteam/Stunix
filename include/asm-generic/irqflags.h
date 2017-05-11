#ifndef ASM_GENERIC_IRQFLAGS_H
#define ASM_GENERIC_STUNIX_IRQFLAGS_H


#ifndef ARCH_IRQ_DISABLED
#define ARCH_IRQ_DISABLED 0
#define ARCH_IRQ_ENABLED 1
#endif


/* read interrupt enabled status */
unsigned long arch_local_save_flags(void);

/* set interrupt enabled status */
void arch_local_irq_restore(unsigned long flags);

/* get status and disable interrupts */
static inline unsigned long arch_local_irq_save(void)
{
	unsigned long flags;
	flags = arch_local_save_flags();
	arch_local_irq_restore(ARCH_IRQ_DISABLED);
	return flags;
}

/* test flags */
static inline int arch_irqs_disabled_flags(unsigned long flags)
{
	return flags == ARCH_IRQ_DISABLED;
}

/* unconditionally enable interrupts */
static inline void arch_local_irq_enable(void)
{
	arch_local_irq_restore(ARCH_IRQ_ENABLED);
}

/* unconditionally disable interrupts */
static inline void arch_local_irq_disable(void)
{
	arch_local_irq_restore(ARCH_IRQ_DISABLED);
}

/* test hardware interrupt enable bit */
static inline int arch_irqs_disabled(void)
{
	return arch_irqs_disabled_flags(arch_local_save_flags());
}

#endif