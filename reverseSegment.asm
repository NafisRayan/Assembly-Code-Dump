
.model small
.stack 100h


.data
message db 'Choices shape our existence$', 0  


.code


reverseSegment MACRO startAddr, segLength
LOCAL loopLabel  


; Preserve registers
push cx
push si
push di
lea si, startAddr    
mov di, si       
add di, segLength   
dec di           
mov cx, segLength   
shr cx, 1        


loopLabel:
    mov al, [si] 
    mov bl, [di] 
    mov [si], bl 
    mov [di], al 
    inc si       
    dec di       
    loop loopLabel  


pop di
pop si
pop cx
ENDM


MAIN_PROC:
mov ax, @data
mov ds, ax
mov si, offset message  
mov cx, 0            


locateWordStart:
cmp byte ptr [si], ' '  
je boundaryFound        
cmp byte ptr [si], '$'  
je endOfText        
inc si                   
inc cx                  
jmp locateWordStart     
boundaryFound:


sub si, cx              
reverseSegment si, cx      
add si, cx              
inc si                   
mov cx, 0                
jmp locateWordStart     
endOfText:
sub si, cx              
reverseSegment si, cx      
mov ah, 9
lea dx, message
int 21h


; Terminate the program
mov ax, 4C00h
int 21h
ENDP


END MAIN_PROC