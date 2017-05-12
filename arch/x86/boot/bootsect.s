# Start the first CPU: switch to 32-bit protected mode, jump into C.
# The BIOS loads this code from the first sector of the hard disk into
# memory at physical address 0x7c00 and starts executing in real mode
# with %cs=0 %ip=7c00.

#define SEG_KCODE 1
#define SEG_KDATA 2

#define CR0_PE    1

.code16                       # Assemble for 16-bit mode
.globl start
start:
  # Set up the important data segment registers (DS, ES, SS).
  xorw    %ax,%ax             # Segment number zero
  movw    %ax,%ds             # -> Data Segment
  movw    %ax,%es             # -> Extra Segment
  movw    %ax,%ss             # -> Stack Segment



  # Set up the stack pointer and call into C.
  movl    $start, %esp
  call    bootmain



  msg1:
  .byte 13,10
   # 回车、换行的 ASCII 码。 
   .ascii "Loading system ..."
   .byte 13,10,13,10
   # 共24 个 ASCII 码字

