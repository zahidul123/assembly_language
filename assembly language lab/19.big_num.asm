.model small
.stack 100h
.data
m1 db '1st number:$'
m2 db 0ah,0dh,'2nd number:$'
m3 db 0ah,0dh,'3rd number:$'
m4 db 0ah,0dh,'biggest number is:$'
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
 
mov ah,9
lea dx,m2
int 21h
mov ah,1
int 21h
mov bh,al

mov ah,9
lea dx,m3
int 21h
mov ah,1
int 21h
mov cl,al 

mov ah,9
lea dx,m4
int 21h

cmp bl,bh
jge level
jmp le_1

le_1:
 cmp bh,cl
 jge le_2
 
 mov ah,2
 mov dl,cl
 int 21h
 jmp exit 
 
le_2:
 mov ah,2
 mov dl,bh
 int 21h
 jmp exit 
 
level:
 cmp bl,cl
 jge le_3
 mov ah,2
 mov dl,cl
 int 21h 
 jmp exit
 
le_3:
  mov ah,2
 mov dl,bl
 int 21h 
 
exit:
mov ah,4ch
int 21h
main endp
end main