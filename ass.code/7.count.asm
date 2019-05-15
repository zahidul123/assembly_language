
.org 100h
include 'emu8086.inc'

print 'input:'

mov ah,1
int 21h

mov bx,0
mov cx,ax

top:

int 21h
inc bx
cmp ax,0dh
je exit
loop top
 
call outdec 
exit:
 
 
  printn ''
 mov ah,2
  mov dx,bx
  int 21h
  
  
  include outdec.asm