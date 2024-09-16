.model small
.stack 100h


.data
    baseValue dw 2          
    exponent dw 3          
    computationResult dw 1
    outputBuffer db 5 dup('$')


.code
main PROC
    mov ax, @data
    mov ds, ax
    mov ax, [baseValue]      
    mov cx, [exponent]      
    call calculatePower       
    mov ax, [computationResult]
    call displayNumber
    mov ax, 4C00h
    int 21h
main ENDP


calculatePower PROC
    mov bx, ax      
    dec cx          
calcLoop:
    cmp cx, 0       
    je endCalculation
    mul bx           
    dec cx          
    jmp calcLoop   


endCalculation:
    mov [computationResult], ax
    ret
calculatePower ENDP


displayNumber PROC
    mov bx, 10
    mov di, offset outputBuffer
    mov cx, 0


convertDigits:
    xor dx, dx
    div bx
    add dl, '0'
    mov [di], dl
    inc di
    inc cx
    test ax, ax
    jnz convertDigits


    mov ah, 02h
    dec di
printDigits:
    mov dl, [di]
    int 21h
    dec di
    loop printDigits


    ret
displayNumber ENDP


END main