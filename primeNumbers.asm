.MODEL SMALL
.STACK 100H
.DATA
    INPUT_MSG DB 'Enter a double digit number: $'
    NEWLINE DB 13, 10, '$'
    LIMIT DB ? ; Variable to store the input limit
    TEMP DB 3, ?, 3 DUP(' ') ; Buffer for input (double digit)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Print the input message
    LEA DX, INPUT_MSG
    MOV AH, 09H
    INT 21H

    ; Read the input from the user
    LEA DX, TEMP
    MOV AH, 0AH
    INT 21H
    
    ; Print a newline
    CALL PRINT_NEWLINE

    ; Convert the input characters to a numeric value
    MOV AL, TEMP + 2 ; Get the first input character
    SUB AL, '0' ; Convert ASCII to numeric
    MOV BL, 10 ; Multiply the first digit by 10
    MUL BL
    MOV LIMIT, AL ; Store the result in LIMIT

    MOV AL, TEMP + 3 ; Get the second input character
    SUB AL, '0' ; Convert ASCII to numeric
    ADD LIMIT, AL ; Add the second digit to LIMIT

    ; Call the procedure to print prime numbers
    MOV CL, 2 ; Start checking from 2

CHECK_PRIME:
    CMP CL, LIMIT ; Compare CL with LIMIT
    JG END_CHECK ; If CL > LIMIT, end the check

    MOV AL, 1 ; Assume the number is prime
    MOV BL, 2 ; Start checking divisibility from 2

DIVISIBILITY_CHECK:
    CMP BL, CL ; Compare BL with CL
    JGE PRINT_PRIME ; If BL >= CL, the number is prime

    MOV AL, CL ; Move the number to AL for division
    XOR AH, AH ; Clear AH before division
    DIV BL ; Divide AL by BL
    CMP AH, 0 ; Check if the remainder is 0
    JE NOT_PRIME ; If remainder is 0, the number is not prime

    INC BL ; Increment BL to check the next divisor
    JMP DIVISIBILITY_CHECK ; Continue checking divisibility

NOT_PRIME:
    MOV AL, 0 ; Mark the number as not prime
    JMP NEXT_NUMBER ; Move to the next number

PRINT_PRIME:
    CMP AL, 1 ; Check if the number is marked as prime
    JNE NEXT_NUMBER ; If not, move to the next number

    ; Print the prime number
    MOV AL, CL ; Move the prime number to AL
    CALL PRINT_NUMBER ; Call the procedure to print the number

    ; Print a newline
    CALL PRINT_NEWLINE

NEXT_NUMBER:
    INC CL ; Move to the next number
    JMP CHECK_PRIME ; Check the next number

END_CHECK:
    MOV AH, 4CH ; Function to terminate the program
    INT 21H

MAIN ENDP

; Procedure to print a number
PRINT_NUMBER PROC
    PUSH AX ; Save AX register
    PUSH BX ; Save BX register
    PUSH CX ; Save CX register
    PUSH DX ; Save DX register

    MOV AH, 0 ; Clear AH
    MOV BL, 10 ; Divide by 10 to get the tens digit
    DIV BL
    MOV BX, AX ; Store the quotient and remainder in BX

    ; Print the tens digit
    MOV DL, BL ; Move the tens digit to DL
    ADD DL, '0' ; Convert to ASCII
    MOV AH, 02H ; DOS print character function
    INT 21H

    ; Print the units digit
    MOV DL, BH ; Move the units digit to DL
    ADD DL, '0' ; Convert to ASCII
    MOV AH, 02H ; DOS print character function
    INT 21H

    POP DX ; Restore DX register
    POP CX ; Restore CX register
    POP BX ; Restore BX register
    POP AX ; Restore AX register
    RET
PRINT_NUMBER ENDP

; Procedure to print a newline
PRINT_NEWLINE PROC
    PUSH DX ; Save DX register
    PUSH AX ; Save AX register
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    POP AX ; Restore AX register
    POP DX ; Restore DX register
    RET
PRINT_NEWLINE ENDP

END MAIN
