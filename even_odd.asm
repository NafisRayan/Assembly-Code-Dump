.model small
.stack 100h
.data
    msg1 db ' is even number', '$'
    msg2 db ' is odd number', '$'
    nl db 0dh, 0ah, '$'

.code
.startup
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; prompt user to enter a number
    mov ah, 1
    int 21h

    ; check if number is even or odd
    mov bl, 2
    div bl
    cmp ah, 0
    je even
    jmp odd

even:
    ; print message for even number
    lea dx, msg1
    mov ah, 9
    int 21h
    jmp exit

odd:
    ; print message for odd number
    lea dx, msg2
    mov ah, 9
    int 21h

exit:
    ; exit program
    mov ah, 4ch
    int 21h
end