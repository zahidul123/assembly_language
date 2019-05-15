.MODEL SMALL
.STACK 100H
.DATA
MSG DB 0DH,0AH,'INPUT: $'
MSG1 DB 0DH,0AH,'OUTPUT: $'

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H 
    
      MOV BL,AL
      
      MOV AH,9
    LEA DX,MSG1
    INT 21H

     MOV AH,00
      
     MOV AL,BL
      
 L1: CMP BL,01
     JE PRINT 
 
      DEC BL
      MUL BL
      
      ;MOV CL,BL
      ;CMP CL,01 
      ;JE PRINT
      
      Jmp L1
       
       
  PRINT: 
  
    
   ADD AL,30H
  MOV AH,2
   MOV DL,AL
   INT 21H
      
      MOV AH,4CH
      INT 21H 
main endp
end main