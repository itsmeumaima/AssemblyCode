org 100h

.DATA
text DB 'Enter a number:$'
num DW ?
output DB 13, 10, 'You entered: $'

.CODE
main PROC
    mov ax, @data
    mov ds, ax

    ; Print the prompt
    mov dx, offset text
    mov ah, 9
    int 21h

    mov num, 0
    mov bl, 10
INPUT:
    mov ah, 1
    int 21h
    cmp al, 13       ; Compare input with Enter key (13)
    je NEXT
    sub al, 48       ; Convert ASCII to number
    mov ah, 0
    mov cx, ax       ; Store the digit in cx
    mov ax, num
    mul bl           ; Multiply current number by 10
    add ax, cx       ; Add the new digit
    mov num, ax      ; Store the result back in num
    jmp INPUT

NEXT:
    lea dx, output   ; Load effective address of output
    mov ah, 9
    int 21h

    ; Display the number
    mov ax, num
    ; Convert number to string
    mov dx, 0
    mov bx, 10
    mov cx, 0
l1:
    div bx
    push dx          ; Save remainder (digit)
    mov dx, 0
    inc cx           ; Count the number of digits
    cmp ax, 0
    jne l1

    mov ah, 2
l2:
    pop dx           ; Get the digit
    add dl, 48       ; Convert to ASCII
    int 21h          ; Print the digit
    loop l2

    mov ah, 4Ch      ; Exit to DOS
    int 21h

main ENDP
END main
