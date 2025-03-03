section .data
    msg db "Hello, world!", 0

section .text
    global _start

_start:
    mov eax, 4 ; call sys_write
    mov ebx, 1 ; stdout
    mov ecx, msg ; load data to print
    mov edx, 13 ; # of characters
    int 0x80 ; call kernel

    mov eax, 1 ; call sys_exit
    xor ebx, ebx ; return 0
    int 0x80 ; call kernel