

#define DEBUG


#include<stunix/debugobjects.h>
#include<stunix/stackprotecter.h>
#include<stunix/irqflags.h>

/*
kernel start
*/
void start_kernel(void)
{

    
    debug_objects_early_init();//初始化内核调试相关,所有debug对象初始化


    boot_init_stack_canary();//栈溢出保护初始化

    local_irq_disable();//关中断

    //boot_cpu_init();//cpu状态初始化

    page_address_init();//页地址初始化


}