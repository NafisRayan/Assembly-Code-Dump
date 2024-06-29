
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
 A dw 1
 b dw 2
 c dw 3
 d dw 5
.code
mov cx,a
add cx ,b


ret




