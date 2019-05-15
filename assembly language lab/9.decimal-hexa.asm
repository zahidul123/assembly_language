

.model small
.stack 100h
.data
m1 db "deci:1$"
m2 db 0ah,0dh, "hexa:$"
.code
main proc
    mov ax,@data
    mov ds,ax 
    
     mov ah,9
    lea dx,m1
    int 21h 
    
    mov ah,1
    int 21h
    
    cmp al,'0'
    jne bb
    mov bx,'A'
    jmp display


     bb:
     cmp al,'1'
    jne cc
    mov bx,'B'
    jmp display   
    
     cc:
    cmp al,'2'
    jne dd
    mov bx,'C'
    jmp display

    dd:
cmp al,'3'
    jne ee
    mov bx,'D'
    jmp display

 ee:
cmp al,'4'
    jne ff
    mov bx,'E'
    jmp display

  ff:
cmp al,'5'
    jne end
    mov bx,'F'
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






