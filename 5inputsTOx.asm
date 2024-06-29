.model small
.stack 100h
.data
    x db 'X', '$'

.code
.startup
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; read the password
    mov ah, 1
    int 21h
    mov ah, 1
    int 21h
    mov ah, 1
    int 21h
    mov ah, 1
    int 21h
    mov ah, 1
    int 21h

    ; overprint the password with X's
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov ah, 9
    lea dx, x
    int 21h
    mov ah, 9
    lea dx, x
    int 21h
    mov ah, 9
    lea dx, x
    int 21h
    mov ah, 9
    lea dx, x
    int 21h
    mov ah, 9
    lea dx, x
    int 21h

    ; exit program
    mov ah, 4ch
    int 21h
end