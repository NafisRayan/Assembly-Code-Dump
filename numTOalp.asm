.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "i$"
    MSG2 DB "k$"
    MSG3 DB "l$"
    MSG4 DB "m$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Take input
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Check the input and print accordingly
    CMP BL, '0'
    JL END_PROGRAM
    CMP BL, '4'
    JL PRINT_I
    CMP BL, '7'
    JL PRINT_K
    CMP BL, '9'
    JG PRINT_M
    JMP PRINT_L

PRINT_I:
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    JMP END_PROGRAM

PRINT_K:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    JMP END_PROGRAM

PRINT_L:
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    JMP END_PROGRAM

PRINT_M:
    LEA DX, MSG4
    MOV AH, 9
    INT 21H

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN