org 100h
include 'emu8086.inc'

print 'Input:'

mov ah,1
int 21h

printn ''    

print 'Output:'

sub al,20h

mov ah,2
mov dl,al
int 21h