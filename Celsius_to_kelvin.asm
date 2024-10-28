org 100h
include 'emu8086.inc'

.DATA
celsius_input DB 5, ?, 5 DUP(0)
K DW ?

.CODE
main PROC
    mov ax,@DATA
    mov ds,ax
    
    print 'Welcome to the Celsius to Kelvin Converter'
    mov ah, 02h                  ; DOS interrupt to print string
    int 21h 
    mov dl,10
    int 21h   
    

    ;mov ah, 09h
    ;int 21h
    print 'Enter the celsius value:' 
    mov ah,02h
    int 21h
    
    mov dx,offset celsius_input
    mov ah,02h
    int 21h
    
    print 'The kelvin value is:'

main ENDP
END
