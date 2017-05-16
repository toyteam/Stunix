ENTRY(start)
SECTIONS
{
	. = 0x7c00;
	.text		: { *(.text) }
    .data		: { *(.data) }
    . = 0x7DFC;
	.bootflag		: { *(.bootflag) }
}