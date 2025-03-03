section .data
    num1 dd 5
    num2 dd 7 
    even_msg db "Even", 10 ;"Even\n"
    even_len equ $-even_msg ;automatic length calculation
    odd_msg db "Odd", 10 ;"Odd\n"
    odd_len equ $-odd_msg ;automatic length calculation

section .bss
    result resb 1 ; reserve 1 byte for result

section .text
    global _start

_start: 
    ;Load numbers and add
    mov eax, dword [num1] ; Load num1 to eax
    add eax, dword [num2] ; Add num2 to eax
    mov dword [result], eax ; Store result in result

    ;Check if result is even or odd
    test eax, 1 ; test the least significant bit
    jz even_case 

odd_case:
    mov eax, 4 ; call sys_write
    mov ebx, 1 ; stdout
    mov ecx, odd_msg ; load data to print
    mov edx, odd_len ; # of characters
    int 0x80 ; call kernel

even_case:
    mov eax, 4 ; call sys_write
    mov ebx, 1 ; stdout
    mov ecx, even_msg ; load data to print
    mov edx, even_len ; # of characters
    int 0x80 ; call kernel

exit:
    mov eax, 1 ; call sys_exit
    xor ebx, ebx ; return 0
    int 0x80 ; call kernel

