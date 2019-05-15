.model small
.stack 100h
.data
m1 db "HELLO WORLD$"
m2 db 0ah,0dh, "CSE DIU$"
.code
main proc
mov ax,@data
mov ds,ax


mov ah,9
lea dx,m1
int 21h 

mov ah,9
lea dx,m2
int 21h

mov ah,4ch
int 21h
main endp
end main




