.org 100h
include 'emu8086.inc'

mov ah,1
repeat:

int 21h
cmp al,' '
je exit

loop repeat

exit:

printn ' '
print 'You enter a space.'