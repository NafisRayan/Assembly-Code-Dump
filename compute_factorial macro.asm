.model small
.stack 100h
.data
inputNumber dw 5
result dw ?


.code


compute_factorial macro value
    mov cx, value     
    mov ax, 1        
    
    factorial_loop:
        mul cx       
        loop factorial_loop 
    mov result, ax     
endm


display_number macro value
    local number_loop, print_done
    mov ax, value
    mov bx, 10
    mov cx, 0


    number_loop:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne number_loop


    print_digits:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop print_digits
endm


mov ax, @data
mov ds, ax
compute_factorial inputNumber


display_number result


mov ax, 4Ch
int 21h


end
