#ifndef ASM_IRQFLAGS_H
#define ASM_IRQFLAGS_H



static inline unsigned long arch_local_save_flags(void)
{
	return native_save_fl(); //The implement of save_flags
}

static inline void arch_local_irq_restore(unsigned long flags)
{
	native_restore_fl(flags);//The implement of irq_restore
}

static inline void arch_local_irq_disable(void)
{
	native_irq_disable();
}

static inline void arch_local_irq_enable(void)
{
	native_irq_enable();
}



#endif