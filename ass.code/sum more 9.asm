.org 100h
include 'emu8086.inc'
  print '1st number:'
  
mov ah,1
int 21h
sub al,30h
mov bl,al
  
  printn ''
  print '2nd number:'
mov ah,1
int 21h
sub al,30h
mov bh,al

add bl,bh
mov al,bl
mov ah,0 
aaa

add al,30h
add ah,30h

mov bx,ax

printn ' '
print 'Sum is:'
mov ah,2
mov dl,bh
int 21h

 mov ah,2
mov dl,bl
int 21h
