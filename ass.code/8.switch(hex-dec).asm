

.org 100h
include 'emu8086.inc' 
    
    print 'input hexa value:'
    mov ah,1
    int 21h
    
    cmp al,'A'
    jne bb
    mov bl,'0'
    jmp display


     bb:
     cmp al, 'B'
    jne cc
    mov bl,'1'
    jmp display   
    
     cc:
    cmp al,'C'
    jne dd
    mov bl,'2'
    jmp display

    dd:
cmp al,'D'
    jne ee
    mov bl,'3'
    jmp display

 ee:
cmp al,'E'
    jne ff
    mov bl,'4'
    jmp display

  ff:
cmp al,'F'
    jne end
    mov bl,'5'
    jmp display 
    
    display:
    
    printn ' '
    print 'output in decimal value:1'
     
    
    mov ah,2
    mov dl,bl
    int 21h
    
   


  end:
    
    printn ' '



