

.org 100h
include 'emu8086.inc'
 mov ah,1
 int 21h
  
 printn ' '
   
 mov ah,2
 mov dl,al
 int 21h