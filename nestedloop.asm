include 'emu8086.inc'
org 100h

.data
answer DW 0

.CODE
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,5
    mov bx,4
    mov cx,bx
    
outer_loop:
    push cx
    mov cx,ax
    
inner_loop: 
    add answer,1
    loop inner_loop
    
    pop cx
    loop outer_loop
    mov ax,answer
    
main endp
end
