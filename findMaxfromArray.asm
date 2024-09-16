.MODEL SMALL
.STACK 100h


.DATA
    count DW 6
    array DW 3, 15, 17, 21, 9, 4
    maxValue DW 0
    msgLabel DB 'Maximum value is: $'


.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, count
    LEA SI, array
    CALL findMax
    LEA DX, msgLabel
    MOV AH, 9
    INT 21h
    MOV AX, maxValue
    CALL displayNumber
    MOV AX, 4C00h
    INT 21h


compareMax PROC
    CMP AX, BX
    JGE proceed
    MOV AX, BX
proceed:
    RET
compareMax ENDP


findMax PROC
    MOV AX, [SI]
    ADD SI, 2


iterate:
    MOV BX, [SI]
    ADD SI, 2
    CALL compareMax
    LOOP iterate


    MOV maxValue, AX
    RET
findMax ENDP


displayNumber PROC
    MOV BX, 10


convertDigits:
    XOR DX, DX
    DIV BX
    ADD DX, '0'
    PUSH DX
    CMP AX, 0
    JNE convertDigits


printDigits:
    POP DX
    MOV AH, 02h
    INT 21h
    CMP SP, 100h
    JNE printDigits
    RET
displayNumber ENDP


END