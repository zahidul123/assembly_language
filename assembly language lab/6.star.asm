 .model small
 .stack 100h
 .data
 m1 db 'how many star:$'
 m2 db 0ah,0dh,'$'
 
 .code
 main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
     
    mov ah,1
    int 21h
    mov bl,al
    sub bl,30h 
    
    mov ah,9
    lea dx,m2
    int 21h
    
    mov cx,0
    mov cl,bl
     
    mov ah,2
    mov dl, '*'
       
    top:
      int 21h 
      loop top
      
    exit:
    
    mov ah,4ch
    int 21h
    
    main endp
 end main
 