MEMORY
{       
    ram    : ORIGIN = 0x0, LENGTH = 0x00001000
}
 
SECTIONS
{
    .text :
    {
        *(.text)
    } > ram
    
    .reginfo :
    {
        *(.reginfo)
    } > ram
}
 
ENTRY (__start)

