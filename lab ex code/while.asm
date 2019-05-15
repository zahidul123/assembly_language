  
  .model small
  .stack 100h  
  .data
  m1 db "haxadecimal:$"
  m2 db 0ah,0dh,"decimal:$"
  .code
  
  main proc
    
   mov ax,@data
   mov ds,ax
   mov ah,9
   lea dx,m1
   int 21h
   mov ah,1
  
   
   cmp al,'A'
   jne bb
   mov bx,'10'
   jmp display 
   
   bb: 
   cmp al,'B'
   jne cc
   mov bx,'11'
   jmp display
   
    cc:
   cmp al,'C'
   jne dd
   mov bx,'12'
   jmp display
   
   dd:
   cmp al,'D'
   jne ee
   mov bx,'13'
   jmp display
    
    ee:
   cmp al,'E'
   jne ff
   mov bx,'14'
   jmp display
   
   
    ff:
   cmp al,'F'
   jne end
   mov bx,'15'
   jmp display
   
   display:
   mov ah,9
   lea dx,m2
   int 21h
    
    mov ah,2
    mov dx,bx
    int 21h
   
   end:
        
   mov ah,4ch
   int 21h
   main endp
  end main