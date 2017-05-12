/*
* SMP对称多处理结构相关接口代码，具体实现在arch下
*
*/

#ifndef STUNIX_SMP_H
#define STUNIX_SMP_H


/*
* smp_processor_id(): get the current CPU ID.
*/
#ifdef CONFIG_DEBUG_PREEMPT
  extern unsigned int debug_smp_processor_id(void);
# define smp_processor_id() debug_smp_processor_id()
#else
# define smp_processor_id() raw_smp_processor_id()
#endif



#endif