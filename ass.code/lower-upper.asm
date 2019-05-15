
.model small
.stack 100h
.data
 
m1 db 'Enter a lowercase latter= $'
m2 db 0dh,0ah, 'Upercase latter is= $'
 
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,20h
    
    mov bl,al
    
    mov ah,9
    lea dx,m2
    int 21h
    
    
        mov ah,2
    mov dl,bl
    int 21h
    
    
    mov ah,4ch
    int 21h
    main endp
end main
    




