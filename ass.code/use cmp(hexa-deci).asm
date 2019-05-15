

.org 100h
include 'emu8086.inc' 
    
    print 'input hexa value:'
    mov ah,1
    int 21h
    
    cmp al,'A'    
    je display 
    cmp al,'B'    
    je display
    cmp al,'C'    
    je display
    cmp al,'D'    
    je display
    cmp al,'E'    
    je display
    cmp al,'F'    
    je display
    
    jmp end
    
    display:
    
    printn ' '
    print 'output in decimal value:1'
     
     sub al,11h
    mov ah,2
    mov dl,al
    int 21h
    
   


  end:
    
    printn ' '



