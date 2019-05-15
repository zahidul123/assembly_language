
.model small
.stack 100h
.data
m1 db 10,13,'Enter A Character=$'
m2 db 0dh,0ah,'Ascii code of $'
m3 db ' is in hexa:$'
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
 input:
     
     mov ah,9
     lea dx,m1
     int 21h
     
     mov ah,1
     int 21h
     
     mov bl,al
     
     cmp al,0dh
     je end
      
     mov ah,9
     lea dx,m2
     int 21h
     
     mov dl,bl
     mov ah,2
     int 21h
     
     mov ah,9
     lea dx,m3
     int 21h
     
     mov cx,4
   
  convert:
  
     mov dl,bh
     shr dl,1 
     shr dl,1
     shr dl,1
     shr dl,1
     
     cmp dl,9
     jbe num
     
     add dl,55d
     jmp display
     
  num:
     
     add dl,30h
     
  display:
  
     mov ah,2
     int 21h
     
     rcl bx,1 
     rcl bx,1
     rcl bx,1
     rcl bx,1
     
     loop convert
     
     jmp input
     
                 
     
     end:
     
     mov ah,4ch
     int 21h
     
     main endp
end main