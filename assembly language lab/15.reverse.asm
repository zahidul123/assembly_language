.model small 
.stack 100h
.data

main proc
mov ah,1
int 21h
push ax
mov ah,1
int 21h 
push ax
mov ah,1
int 21h
push ax 
 
mov ah,1
int 21h
push ax
mov ah,1
int 21h
push ax
mov ah,1
int 21h
push ax
mov ah,1
int 21h 
push ax

mov ah,1
int 21h
push ax 
mov ah,1
int 21h
push ax 
mov ah,1
int 21h
push ax


mov ah,1
int 21h 
push ax

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h 

pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h

pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h

pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h

pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h

pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h
pop bx 
mov ah,2
mov dx,bx
int 21h

mov ah,4ch
int 21h

main endp
end main
