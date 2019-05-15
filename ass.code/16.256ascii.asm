.org 100h
include 'emu8086.inc'

mov ah,2
mov cx,256
mov dl,0

print:
int 21h
inc dl
dec cx
jnz print
