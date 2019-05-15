
.org 100h
include 'emu8086.inc'

print '1st number:' 

mov ah,1
int 21h

mov bl,al 

printn ' '
print '2nd number:'

mov ah,1
int 21h

mov bh,al

printn ' '
print '3rd number:'

mov ah,1
int 21h

mov cl,al 

printn ' '

print 'biggest number is:'

cmp bl,bh
jge level
jmp le_1

le_1:

 cmp bh,cl
 jge le_2
 
 mov ah,2
 mov dl,cl
 int 21h
 
 jmp exit 
 
le_2:
  
  mov ah,2
 mov dl,bh
 int 21h
 
 jmp exit 
 
level:

 cmp bl,cl
 jge le_3
 
 mov ah,2
 mov dl,cl
 int 21h 
 
 jmp exit
 
le_3:
  
  mov ah,2
 mov dl,bl
 int 21h 
 

exit:

 printn ' '  