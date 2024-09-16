.model small
.stack 100h


displayMessage MACRO message
    lea dx, message  
    mov ah, 9       
    int 21h         
ENDM


.data
    greeting db 'Greetings, universe! I am Nafis Rayan$', 0  


.code
START PROC
    mov ax, @data
    mov ds, ax


    displayMessage greeting


    mov ax, 4C00h
    int 21h
START ENDP


END START