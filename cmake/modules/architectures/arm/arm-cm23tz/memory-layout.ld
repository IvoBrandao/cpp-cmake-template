ENTRY(_start)

MEMORY
{
    FLASH_NON_SECURE (rx) : ORIGIN = 0x00000000, LENGTH = 64K
    RAM_NON_SECURE (rwx) : ORIGIN = 0x20000000, LENGTH = 16K
    FLASH_SECURE (rx) : ORIGIN = 0x10000000, LENGTH = 64K
    RAM_SECURE (rwx) : ORIGIN = 0x30000000, LENGTH = 16K
}

SECTIONS
{
    .text :
    {
        *(.text)
        *(.text.*)
    } > FLASH_NON_SECURE : FLASH_SECURE

    .data :
    {
        *(.data)
        *(.data.*)
    } > RAM_NON_SECURE : RAM_SECURE AT > FLASH_NON_SECURE

    .bss :
    {
        *(.bss)
        *(.bss.*)
    } > RAM_NON_SECURE : RAM_SECURE
}
