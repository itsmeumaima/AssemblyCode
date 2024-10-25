org 100h
include 'emu8086.inc'    

.DATA
str DB 4 DUP ?

.CODE
main PROC  
    print 'Enter the 4 character string:'
    mov ah,01h
    int 21h
    mov str[0],al
    int 21h
    mov str[1],al
    int 21h
    mov str[2],al
    int 21h
    mov str[3],al
    mov ah,02h
    mov dl,10
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    print 'The reversed string is:'
    mov ah,02h
    mov dl,str[3]
    int 21h
    mov dl,str[2]
    int 21h
    mov dl,str[1]
    int 21h
    mov dl,str[0]
    int 21h
main ENDP
ENDP
