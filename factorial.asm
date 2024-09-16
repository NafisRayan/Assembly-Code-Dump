.model small
.stack 100h
.data
    prompt_msg db 'enter a number (1-99): $'
    line_break db 13, 10, '$'
    num_input db ?
    result db 4, ?, 4 dup(' ')


.code
main proc
    mov ax, @data
    mov ds, ax


    lea dx, prompt_msg
    mov ah, 09h
    int 21h


    lea dx, result
    mov ah, 0ah
    int 21h


    call print_line_break


    mov cl, result + 1
    cmp cl, 1
    je single_digit_input


    mov al, result + 2
    sub al, '0'
    mov bl, 10
    mul bl
    mov num_input, al


    mov al, result + 3
    sub al, '0'
    add num_input, al
    jmp verify_prime


single_digit_input:
    mov al, result + 2
    sub al, '0'
    mov num_input, al


verify_prime:
    mov cl, 2


prime_check_loop:
    cmp cl, num_input
    jg end_program


    mov al, 1
    mov bl, 2


divisibility_test:
    cmp bl, cl
    jge print_prime_output


    mov al, cl
    xor ah, ah
    div bl
    cmp ah, 0
    je not_prime_output


    inc bl
    jmp divisibility_test


not_prime_output:
    mov al, 0
    jmp next_iteration


print_prime_output:
    cmp al, 1
    jne next_iteration


    mov al, cl
    call print_number_output


    call print_line_break


next_iteration:
    inc cl
    jmp prime_check_loop


end_program:
    mov ah, 4ch
    int 21h


main endp


print_number_output proc
    push ax
    push bx
    push cx
    push dx


    mov ah, 0
    mov bl, 10
    div bl
    mov bx, ax


    cmp bl, 0
    je print_units


    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h


print_units:
    mov dl, bh
    add dl, '0'
    mov ah, 02h
    int 21h


    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number_output endp


print_line_break proc
    push dx
    push ax
    lea dx, line_break
    mov ah, 09h
    int 21h
    pop ax
    pop dx
    ret
print_line_break endp


end main