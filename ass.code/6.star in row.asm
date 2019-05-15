 ;star in a row
 
 org 100h
 include 'emu8086.inc'

 print 'how many star:'
 
 
    mov ah,1
    int 21h
    
    sub al,30h
    printn ' '
    
    mov cx,0
    mov cl,al
    
    top:
      
      mov ah,2
      mov dl,'*'
      int 21h
  
      loop top
 