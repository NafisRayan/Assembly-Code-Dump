.model small
.stack 100h


.data
    value1 dw 50
    value2 dw 10
    value3 dw 17
    largestValue dw ?


.code
find_max_of_three macro val1, val2, val3
    mov ax, val1
    cmp ax, val2
    jge compare_third
    mov ax, val2
compare_third:
    cmp ax, val3
    jge finalize
    mov ax, val3
finalize:
    mov largestValue, ax
endm


mov ax, @data
mov ds, ax


find_max_of_three value1, value2, value3


mov ax, largestValue
mov bx, 10
xor cx, cx


convert_digits:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_digits


print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits


mov ax, 4Ch
int 21h
end