  ;vowel-consonent
  
  
.org 100h
include 'emu8086.inc'
    
    mov ah,1
    int 21h
    
    cmp al,'a'
    je  vowel
    cmp al,'e'
    je vowel
    cmp al,'i'
    je vowel
    cmp  al,'o'
    je vowel   
    
    cmp  al,'u'
    je vowel 
    
    jmp consonant
    
    
    
    vowel:       
    printn ''
    
    print 'vowel'
    
    jmp end_case
    
    
    
    consonant:    
  
      printn ''
    
    print 'consonent'
    

    
    
    end_case: 
    
    printn ''
    
    
