ENTRY(_start)

MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 512K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
    .text :
    {
        *(.text)
        *(.text.*)
    } > FLASH

    .data :
    {
        *(.data)
        *(.data.*)
    } > RAM AT > FLASH

    .bss :
    {
        *(.bss)
        *(.bss.*)
    } > RAM
}
