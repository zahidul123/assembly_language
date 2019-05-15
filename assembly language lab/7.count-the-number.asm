.model small
.stack 100h
.data
m1 db 'Input: $'
m2 db 0dh,0ah,'Output:' 
t db ?,'$' 

.code
main proc
    mov ax,@data
    mov ds,ax
    xor bx,bx
    mov bx,0 
    
    
    lea dx,m1
    mov ah,9
    int 21h  
    
 input:
    mov ah,1
    int 21h  
    cmp al,0dh
    je output 
    inc bx
    jmp input
output:
    mov t,bl
    add t,48
    
    lea dx,m2
    mov ah,9
    int 21h
end:    
    mov ah,4ch
    int 21h 
    
    main endp

end main