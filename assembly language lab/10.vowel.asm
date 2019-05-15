
.model small
.stack 100h
.data
                       
                       
                       
m1  db 0ah,0dh , "vowel$" 

m2  db 0ah,0dh , "consonant$"
.code   


main proc   
    
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    cmp al,'a'
    je  vowel
    cmp al,'e'
    je vowel
    cmp al,'i'
    je vowel
    cmp  al,'o'
    je vowel   
    
    cmp  al,'u'
    je vowel 
    
    jmp consonant
    
    
    jmp 
    
    vowel:       
    mov ah,9
    lea dx,m1
    int 21h
    
    jmp end_case
    
    
    
    consonant:    
    mov ah,9
    lea dx,m2
    int 21h
    
    

    
    
    end_case: 
    mov ah,4ch
    int 21h
    main endp
end main
vowel.txt
Displaying vowel.txt.


