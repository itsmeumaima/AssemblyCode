org 100h
.model small
.stack 100h  

.data
Greeting DB 13,10,'Hello! Welcome to Celcius to Kelvin Converter $' 
inp DB 13,10,'Enter Temperature in Celsius $'
No DW ?    
outp DB 13,10,'You Entered: $'            
Result DB 13,10,'Kelvin Temperature is:$'
K DW 273
.CODE
MAIN PROC 
 mov dx , offset Greeting ;for printing string
 mov AH,9
 int 21h
 
 mov dx , offset inp ;for printing string
 mov AH,9
 int 21h
 
 mov No,0   ;N=0
 mov BL,10  ;BL=10
 INPUT:     ;LABEL
 mov AH,1   ;Input a character => stores in AL=2 e.g (input 2)
 int 21h    ;interupt
 CMP AL,13  ;compare input with enter key
 JE NEXT    ;if jump equal to then it jumps on label next
 SUB AL,30h ;sub AL=AL-48=AL-30h
 mov AH,0   ;AH=0
 mov CX,AX  ;CX=AX => CX=2
 mov AX,No  ;AX=N => AX=0
 mul BL     ;multiply => AX = BL*AX = 10*0=0
 ADD AX,CX  ;Add => AX=AX +CX =0+2 =2
 mov No,AX  ;N=AX => N=2
 JMP INPUT
 
 NEXT:
 MOV BX ,No 
 Add K,BX 
 
 LEA DX,outp
 mov AH,9
 int 21h

 ;output code celsius temperature
 mov AX,No  ;AX=N=>25
 
 mov DX,0   ;DX=0
 MOV BX,10  ;BX=10
 mov CX,0   ;CX=0 => counter loop
 
 L1:
 div bx     ;divide => AX=AX/BX =25/10
 ;incase of 8bit reg => AL=quotient , AH = remainder 
 ;incase of 16bit reg => AX=quotient , DX = remainder
 ;AX =2, DX=5
 push dx    ;5 save in stack
 mov dx,0   ;DX =0
 mov ah,0   ;AX AH 00000000 AL=quotient
 inc cx
 cmp ax,0   ;(2==0)
 jne L1     ;jump not equal => (AX !=0)
 mov ah,2   ;output character
 
 L2:
 pop dx     ;first time pop 2 and second time pop 5 =25
 add dx,48
 int 21h
 loop L2 
 
 LEA DX,Result
 mov AH,9
 int 21h
 
 ;output code Kelvin temperature
 mov AX,K   ;AX=N=>25
 
 mov DX,0   ;DX=0
 MOV BX,10  ;BX=10
 mov CX,0   ;CX=0 => counter loop
 
 L3:
 div bx     ;divide => AX=AX/BX =25/10
 ;incase of 8bit reg => AL=quotient , AH = remainder 
 ;incase of 16bit reg => AX=quotient , DX = remainder
 ;AX =2, DX=5
 push dx    ;5 save in stack
 mov dx,0   ;DX =0
 mov ah,0   ;AX AH 00000000 AL=quotient
 inc cx
 cmp ax,0   ;(2==0)
 jne L3     ;jump not equal => (AX !=0)
 mov ah,2   ;output character
 
 L4:
 pop dx     ;first time pop 2 and second time pop 5 =25
 add dx,48
 int 21h
 loop L4 
 
 ret
