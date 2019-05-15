;Srting Input Output.asm    

.MODEL SMALL
.STACK 100H
.DATA  
STR DB 16H DUP("$")  ;Duplicate Data in Parenthesis By STACK_SIZE Time
msg1 DB "PLEASE ENTER YOUR NAME : $" 
msg2 DB 0AH, 0DH, "HELLO ! MR. $" 
.CODE
START: 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,msg1
    MOV AH,9
    INT 21H 
    
    MOV AH, 0AH 
    LEA DX,STR
    INT 21H   
    
    LEA DX,msg2
    MOV AH,9
    INT 21H
        
    LEA DX,STR+2
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H 
    
    END START
