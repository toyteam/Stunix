# Start the first CPU: switch to 32-bit protected mode, jump into C.
# The BIOS loads this code from the first sector of the hard disk into
# memory at physical address 0x7c00 and starts executing in real mode
# with %cs=0 %ip=7c00.

SEG_KCODE=1
SEG_KDATA=2

CR0_PE=1




SETUPLEN=4              # setup程序的扇区数(setup-sectors)值
BOOTSEG = 0x07c0          # original address of boot-sector 
                          # bootsect 的原始地址（是段地址，以下同）
INITSEG=0x9000         # we move boot here - out of the way
                          # 将bootsect 移到这里 -- 避开
SETUPSEG=0x9020         # setup starts here
                          # setup 程序从这里开始
SYSSEG=0x1000         # system loaded at 0x10000 (65536).
                          # system 模块加载到0x10000（64 kB）处
ENDSEG=SYSSEG + SYSSEG


.code16                       # Assemble for 16-bit mode
.globl start

.section .text

start:
  # Set up the important data segment registers (DS, ES, SS).
  movw    $0,%ax             # Segment number zero
  movw    %ax,%ds             # -> Data Segment
  movw    %ax,%es             # -> Extra Segment
  movw    %ax,%ss             # -> Stack Segment
  movw    %ax,%fs
  movw    $0x7c00,%sp
  

  # Set vga text mode
  movw $0x0600,%ax
  movw $0x0700,%bx
  movw $0,%cx
  movw $0x184f,%dx

  int $0x10


  # Output loading system
  # Get cursor position
  movb     $0x03,%ah
  movb     $0,%bh
  int     $0x10


  movw $msg1,%ax
  movw %ax,%bp
  
  
  movw $24,%cx
  movw $0x1301,%ax
  movw $0x0002,%bx

  int $0x10
  

undef_root:
  jmp undef_root

  # Set up the stack pointer and call into C.
  # movl    $start, %esp
  # call    bootmain
.section .data
msg1:
  .byte 13,10
   # 回车、换行的 ASCII 码。 
   .ascii "Loading system ..."
   .byte 13,10,13,10
   # 共24 个 ASCII 码字

.section .bootflag
  boot_flag:    # 引导标识
    .word 0x0000
    .byte 0x55
    .byte 0xAA

