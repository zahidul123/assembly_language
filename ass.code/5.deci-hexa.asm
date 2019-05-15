;deci-hexa

org 100h
include 'emu8086.inc'

print 'Input:1'

mov ah,1
int 21h

printn ''

print 'Output:' 

add al,11h
mov ah,2
mov dl,al
int 21h