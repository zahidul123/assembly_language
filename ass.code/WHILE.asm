org 100h
.code
 
mov ah,1
int 21h 
    
mov dx,0
while:
  
  
  cmp al,' '
  
  je end_while
  inc dx
  int 21h
  jmp while
   
   call outdec
  end_while:
      add dx,30H
      mov ah,2
      int 21h
      
     include outdec.asm 
      