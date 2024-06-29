.model small
.stack 100h
.data
    msg1 db ' 31 days', '$'
    msg2 db ' 28 days', '$'
    msg3 db ' 31 days', '$'
    msg4 db ' 30 days', '$'
    msg5 db ' 31 days', '$'
    msg6 db ' 30 days', '$'
    msg7 db ' 31 days', '$'
    msg8 db ' 31 days', '$'
    msg9 db ' 30 days', '$'
    msg10 db ' 31 days', '$'
    msg11 db ' 30 days', '$'
    msg12 db ' 31 days', '$'
    nl db 0dh, 0ah, '$'

.code
.startup
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; prompt user to enter a month
    mov ah, 1
    int 21h

    ; subtract '0' from the input to get the month number
    sub al, 30h

    ; check the month and print the number of days
    cmp al, 1
    je jan
    cmp al, 2
    je feb
    cmp al, 3
    je mar
    cmp al, 4
    je apr
    cmp al, 5
    je may
    cmp al, 6
    je jun
    cmp al, 7
    je jul
    cmp al, 8
    je aug
    cmp al, 9
    je sep
    cmp al, 10
    je oct
    cmp al, 11
    je nov
    cmp al, 12
    je dec

jan:
    ; print number of days for January
    lea dx, msg1
    mov ah, 9
    int 21h
    jmp exit

feb:
    ; print number of days for February
    lea dx, msg2
    mov ah, 9
    int 21h
    jmp exit

mar:
    ; print number of days for March
    lea dx, msg3
    mov ah, 9
    int 21h
    jmp exit

apr:
    ; print number of days for April
    lea dx, msg4
    mov ah, 9
    int 21h
    jmp exit

may:
    ; print number of days for May
    lea dx, msg5
    mov ah, 9
    int 21h
    jmp exit

jun:
    ; print number of days for June
    lea dx, msg6
    mov ah, 9
    int 21h
    jmp exit

jul:
    ; print number of days for July
    lea dx, msg7
    mov ah, 9
    int 21h
    jmp exit

aug:
    ; print number of days for August
    lea dx, msg8
    mov ah, 9
    int 21h
    jmp exit

sep:
    ; print number of days for September
    lea dx, msg9
    mov ah, 9
    int 21h
    jmp exit

oct:
    ; print number of days for October
    lea dx, msg10
    mov ah, 9
    int 21h
    jmp exit

nov:
    ; print number of days for November
    lea dx, msg11
    mov ah, 9
    int 21h
    jmp exit

dec:
    ; print number of days for December
    lea dx, msg12
    mov ah, 9
    int 21h

exit:
    ; exit program
    mov ah, 4ch
    int 21h
end