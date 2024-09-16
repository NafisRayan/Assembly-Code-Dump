.model small
.stack 100h


checkBrackets MACRO inputStr
    mov cx, 0
    lea si, inputStr


searchLoop:
    mov al, [si]
    cmp al, '('
    je increaseCounter
    cmp al, ')'
    je decreaseCounter
    cmp al, 0
    je evaluationComplete
    inc si
    jmp searchLoop


increaseCounter:
    inc cx
    inc si
    jmp searchLoop


decreaseCounter:
    dec cx
    inc si
    jmp searchLoop


evaluationComplete:
    cmp cx, 0
    je bracketsBalanced
    mov dx, offset imbalanceMsg
    mov ah, 09h
    int 21h
    jmp finish


bracketsBalanced:
    mov dx, offset balanceMsg
    mov ah, 09h
    int 21h


finish:
    ret
ENDM


.data
    imbalanceMsg db "Brackets are NOT balanced.$"
    balanceMsg db "Brackets are balanced.$"
    expression db "(x + y) - (z - w$"


.code
main PROC
    mov ax, @data
    mov ds, ax
    checkBrackets expression


    mov ax, 4Ch
    int 21h
main ENDP
END main