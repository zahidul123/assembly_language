.org 100h
include 'emu8086.inc'

mov bh,3
mov bl,0
mov ah,2

loop_1:

cmp bh,0
je end
mov bl,0

loop_2:

cmp bl,bh
jge end_1

mov dl,'*'
int 21h
inc bl
jmp loop_2

end_1:

printn ' '

dec bh

jmp loop_1

end:
   printn ' '
 
 