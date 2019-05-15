
.model small
.stack 100h
.data

m1 db 'ENTER A DECIMAL VALUE:1$'
m2 db 0dh,0ah,'IN HEXA IT IS $'

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
    add bl,11h
    
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
     



