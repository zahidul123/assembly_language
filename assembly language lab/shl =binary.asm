.MODEL SMALL
 .STACK 100H

 .DATA
   M1  DB  'Enter the character : $'
   M2  DB  0DH,0AH,'binary form is : $'
   M3  DB  0DH,0AH,'The number of 1 bits in ASCII code are : $'

 .CODE
   MAIN PROC 
    
     MOV AX, @DATA                
     MOV DS, AX

               
     MOV AH, 9
      LEA DX, M1 
     INT 21H

     MOV AH, 1                   
     INT 21H

                     
     MOV BL, AL                  

                
     MOV AH, 9 
     LEA DX, M2  
     INT 21H

                        
     MOV CX, 8                   
     MOV AH, 2                    

     op:                     
       SHL BL, 1                  

       JNC ZE                
       INC BH                     
       MOV DL, 31H                
       JMP DIS            

       ZE:                    
         MOV DL, 30H              

       DIS:                 
         INT 21H                 
     LOOP op                 

                 
     MOV AH, 9 
     LEA DX, M3 
     INT 21H

     OR BH, 30H                   

     MOV AH, 2                    
     MOV DL, BH
     INT 21H

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN




