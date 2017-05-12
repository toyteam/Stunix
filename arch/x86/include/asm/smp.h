#ifndef ASM_SMP_H
#define ASM_SMP_H


#ifdef CONFIG_X86_32_SMP

#define raw_smp_processor_id() (this_cpu_read(cpu_number))
extern int safe_smp_processor_id(void);

#elif defined(CONFIG_X86_64_SMP)
#define raw_smp_processor_id() (this_cpu_read(cpu_number))

#define safe_smp_processor_id()		smp_processor_id()

#endif

#endif