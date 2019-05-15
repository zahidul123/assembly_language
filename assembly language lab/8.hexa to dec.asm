

.model small
.stack 100h
.data
m1 db  "hexa:$"
m2 db 0ah,0dh,"deci:1$"
.code
main proc
    mov ax,@data
    mov ds,ax 
    
     mov ah,9
    lea dx,m1
    int 21h 
    
    mov ah,1
    int 21h
    
    cmp al,'A'
    jne bb
    mov bx,'0'
    jmp display


     bb:
     cmp al, 'B'
    jne cc
    mov bx,'1'
    jmp display   
    
     cc:
    cmp al,'C'
    jne dd
    mov bx,'2'
    jmp display

    dd:
cmp al,'D'
    jne ee
    mov bx,'3'
    jmp display

 ee:
cmp al,'4'
    jne ff
    mov bx,'E'
    jmp display

  ff:
cmp al,'F'
    jne end
    mov bx,'5'
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






