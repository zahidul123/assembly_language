.model small
.stack 100h
.data

m1 db 0dh,0ah,'Even$'
m2 db 0dh,0ah,'Odd$'
.code

main proc
 
 mov ax,@data
 mov ds,ax
 
    

mov ah,1
int 21h

sub al,30h


mov dl,2
div dl

cmp ah,0
je even

mov ah,9
lea dx,m2
int 21h

jmp exit

even:

 mov ah,9
lea dx,m1
int 21h

exit:
   
   mov ah,4ch
   int 21h
   
   main endp
end main
