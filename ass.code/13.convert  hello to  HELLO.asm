.model small
.stack 100h 
.code 

main proc
mov ah,1
int 21h
mov dh,al

int 21h
mov bh,al

int 21h
mov cl,al

int 21h
mov ch,al

int 21h
mov bl,al 

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h


mov ah,2
sub dh,20h
mov dl,dh
int 21h

sub bh,20h
mov dl,bh
int 21h

sub cl,20h
mov dl,cl
int 21h 

sub ch,20h
mov dl,ch
int 21h

sub bl,20h
mov dl,bl
int 21h

mov ah,4ch
int 21h
main endp
end main