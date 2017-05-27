# ----------------------------------------------------------------
#
#   header.s 
#
# ----------------------------------------------------------------

# Multiboot magic number
MBOOT_HEADER_MAGIC  = 0x1BADB002

# 0 号位表示所有的引导模块将按页(4KB)边界对齐
MBOOT_PAGE_ALIGN    =   1 << 0

# 1 号位通过 Multiboot 信息结构的 mem_* 域包括可用内存的信息
# (告诉GRUB把内存空间的信息包含在Multiboot信息结构中)
MBOOT_MEM_INFO  =   1 << 1    

# 定义我们使用的 Multiboot 的标记
MBOOT_HEADER_FLAGS  =   MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO

# 域checksum是一个32位的无符号值，当与其他的magic域(也就是magic和flags)
# 相加时，要求其结果必须是32位的无符号值 0 (即magic+flags+checksum = 0)
MBOOT_CHECKSUM  =   -(MBOOT_HEADER_MAGIC+MBOOT_HEADER_FLAGS)

MBOOT_HEADR_ADDR     =  0x1000000
MBOOT_LOAD_ADDR     =  0x00000000
MBOOT_LOAD_END_ADDR     =  0x00000000
BSS_END_ADDR     =  0x00000000
ENTRY_ADDR     =  0x00000000
MODE_TYPE     =  0x00000000
WIDTH     =  0x00000000
HEIGHT     =  0x00000000
DEPTH     =  0x00000000


STACK_TOP = stack_top-1



# -----------------------------------------------------------------------------

.globl start
.extern boot_main

.code32
.section .text

.long MBOOT_HEADER_MAGIC
.long MBOOT_HEADER_FLAGS
.long MBOOT_CHECKSUM
.long MBOOT_HEADR_ADDR               # 如果设置了flags[16]
.long MBOOT_LOAD_ADDR                 # 如果设置了flags[16]
.long MBOOT_LOAD_END_ADDR             # 如果设置了flags[16]
.long BSS_END_ADDR              # 如果设置了flags[16]
.long ENTRY_ADDR                # 如果设置了flags[16]
.long MODE_TYPE                 # 如果设置了flags[2]
.long WIDTH                     # 如果设置了flags[2]
.long HEIGHT                    # 如果设置了flags[2]
.long DEPTH                     # 如果设置了flags[2]

start:
    cli              # 此时还没有设置好保护模式的中断处理，要关闭中断
                 # 所以必须关闭中断
    movl STACK_TOP,%esp       # 设置内核栈地址
    movl $0,%ebp       # 帧指针修改为 0
    andl $0xFFFFFFF0,%esp  # 栈地址按照16字节对齐
    movl %ebx,glb_mboot_ptr # 将 ebx 中存储的指针存入全局变量

    movw	$0xfffc, %dx	# Make sure we're not zero
    movw	%ax, %ss
	movzwl	%dx, %esp	# Clear upper half of %esp
	sti			# Now we should have a working stack

# Jump to C code (should not return)
    calll	boot_main    # 调用内核环境初始化函数

stop:
    hlt              # 停机指令，可以降低 CPU 功耗
    jmp stop         # 到这里结束，关机什么的后面再说
# -----------------------------------------------------------------------------

.section .bss             # 未初始化的数据段从这里开始
stack:
    .rept 32768       # 这里作为内核栈
    .byte 0
    .endr

glb_mboot_ptr:           # 全局的 multiboot 结构体指针
    .quad 0
stack_top:


# -----------------------------------------------------------------------------
