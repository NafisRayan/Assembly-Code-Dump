.model small
.stack 100h


.data
    numArray db 10, 20, 3, 40, 50    
    searchValue db 3
                    
    arrayLength db 5              
    isFound db 0                
    foundMsg db 'Value exists$', 0
    notFoundMsg db 'Value does not exist$', 0


.code
main proc
    mov ax, @data
    mov ds, ax
    mov byte ptr isFound, 0
    lea si, numArray
    mov al, searchValue
    mov cl, arrayLength
    call findValueInArray
    cmp isFound, 1
    je valueDetected
    mov ah, 09h
    lea dx, notFoundMsg
    int 21h
    jmp endProgram


valueDetected:
    mov ah, 09h
    lea dx, foundMsg
    int 21h


endProgram:
    mov ax, 4Ch
    int 21h


main endp


findValueInArray proc
    mov bl, 0
searchLoop:
    cmp cl, 0
    je endSearch
    mov al, [si]
    cmp al, searchValue
    je valueLocated
    inc si
    dec cl
    jmp searchLoop


valueLocated:
    mov bl, 1


endSearch:
    mov isFound, bl
    ret


findValueInArray endp


end main