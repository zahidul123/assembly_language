

.org 100h
include 'emu8086.inc'

print 'decimal value is:1' 
    
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
    printn ' '
    print 'hexa value is:'  
    
    mov ah,2
    mov dx,bx
    int 21h
    
    end:
    
    printn ' '





