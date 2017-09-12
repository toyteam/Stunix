

MBOOT_MAGIC = 0x1BADB002	# multiboot magic域，必须为此值
MBOOT_FLAGS = 0x00		# multiboot flag域, GRUB启动时是否要做一些特殊操作
MBOOT_CHECKSUM = -(MBOOT_MAGIC + MBOOT_FLAGS)	# multiboot checksum域，校验上面两个域是否正确

.code32                    # 以32位编译
.globl start
 
.section .text
  .int  MBOOT_MAGIC
  .int  MBOOT_FLAGS
  .int  MBOOT_CHECKSUM
  .int  start

.extern boot_main         # 内核入口函数, EXTERN表明此符号在外部定义
 
start:
  cli                        # 禁用中断
  call boot_main           # 调用内核入口函数

stop:
  jmp stop                      # 无限循环
