  
  .model small
  .stack 100h
  .code
  main proc
            
            MOV AH,1
            INT 21H
  
      cmp al,'1'
      je odd
      cmp al,'3'
      je odd
      
   
    
      cmp al,'2'
      je even
      
      cmp al,'4'
      je even
      jmp end_case
      
     odd:
     mov dl,'o'
     jmp display
     even:
      mov dl,'e'
      
      display:
      
      
      
      mov ah,2
      int 21h
       
      
      end_case:
      
      MOV AH,4CH
      MAIN ENDP
  END MAIN