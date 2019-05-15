.model small
.stack 100h
.data
m1 db "how many star:$"
m2 db 0ah,0dh, "$" 
time dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    
     mov ah,9
    lea dx,m1
    int 21h  
    
    
     call indec
     
     mov bx,1
     mov cx,ax
     mov time,1
     
      
     
     print:
     
     mov ah,9
     lea dx,m2
     int 21h
     
     
     while:
     
     dec time
     
     mov ah,2
     mov dl,'*'
     int 21h
     
     cmp time,0
     jg while
     je exit
     
    
     
     exit:
     add bx,1
     mov time,bx
     loop print
     
     mov ah,4ch
     int 21h
     
     main endp
       include indec.asm
end main
     