;odd/even


.org 100h
include 'emu8086.inc'

mov ah,1
int 21h

sub al,30h


mov bl,2
div bl

cmp ah,0
je even

printn ' '

print 'ODD'

jmp exit

even:

 printn ' '

print 'EVEN'

exit:
   
   printn ' '
