.model small
.stack 100h
.data

m1 db 0dh,0ah,'You press enter.$'

.code

main proc
 
 mov ax,@data
 mov ds,ax
 
 mov ah,1
 
 repeat:
 
   int 21h
   cmp al,0dh
   je exit
   
   loop repeat
   
   exit:
   
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main