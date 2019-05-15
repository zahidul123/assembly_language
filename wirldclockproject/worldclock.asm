                 
.model small
.stack 200h
.data
mgs1 db 10,13,"select your country-> $"
ban db 10,13,"1.Bangladesh $"
ind db 10,13,"2.India $" 
jpn db 10,13,"3.Japan$"
aus db 10,13,"4.Australia$"
ger db 10,13,"5.Germanny $"
ame db 10,13,"6.America$"
mgs2 db 13,10,"Enter the number which country you wnat to know the time-> $"
mgs3 db 10,13,"Enter the time in your country hh-mm-ss -> $"
mgs4 db 10,13,"your query country timr is now-> $"

inp1 dw ?
inp2 dw ?
inp3 dw ?
inp4 dw ?

var1 dw ?
var2 dw ?
var3 dw ?
var4 dw ?
 
.code
 
main proc 
    
include 'emu8086.inc'

DEFINE_SCAN_NUM

DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM 
DEFINE_PTHIS
mov ax,@data
mov ds,ax

mov ah,9
lea dx,ban
int 21h
lea dx,ind
int 21h
lea dx,jpn
int 21h         ;print all message
lea dx,aus
int 21h 
lea dx,ger
int 21h
lea dx,ame
int 21h 

lea dx,mgs1
int 21h

call scan_num
mov inp1,cx
 
cmp inp1,1
je bang

cmp inp1,2
je hindi


cmp inp1,3
je japa

cmp inp1,4
je austro

cmp inp1,5
je german
                
cmp inp1,6
je amirica


bang: 

   CALL   pthis
   DB  13, 10, 'Your urrent countryis BANGLADESH ', 0 
   mov ah,9
   lea dx,mgs3    ;message for time entering
   int 21h
    
   call scan_num
   mov  inp2,cx
   mov var4,cx
   mov ah,2        ;hour entering with new line
   mov dl,10
   int 21h 
   mov dl,13
   int 21h
   
   call scan_num
   mov  inp3,cx
   mov ah,2
   mov dl,10      ;minute entering with new line
   int 21h 
   mov dl,13
   int 21h  
   
   call scan_num
   mov  inp4,cx
   mov ah,2
   mov dl,10     ;second entering with new line
   int 21h 
   mov dl,13
   int 21h 
   
   cmp inp2,24
   jnl error  ;compare input time greater than 24 or not
   cmp inp3,60
   jnl error  ;compare input minute greater than 60 or not
   cmp inp4,60
   jnl error  ;compare input second greater than 60 or not
   
   mov ah,9
   lea dx,mgs2    ;message for query country
   int 21h
   call scan_num
   mov var1,cx 
   

   cmp inp2,12    ;compare input time greater than 12 or not
   jg pm 
   
   CALL   pthis
   DB  13, 10, 'Your country time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   
   
Lban:
   
 cmp var1,2
 je hindivsban

 cmp var1,3
 je japavsban

 cmp var1,4
 je austrovsban

 cmp var1,5
 je germanvsban
                
 cmp var1,6
 je amiricavsban
 
pm:
  CALL   pthis
   DB  13, 10, 'Your country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
  jmp Lban
   
 hindivsban:
  ;india is 30 minute faster than us
  
  add inp3,30
  cmp inp3,60
  jge lf
  mov ax,inp3 
  jmp print
  
 lf:
  sub inp3,60
  mov ax,inp3
  inc inp2
  cmp inp2,24
  jle print
  sub inp2,24 
 
 print:
   mov ax,var4
   mov inp2,ax
   cmp inp2,12    ;compare input time greater than 12 or not
   jge oppm 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 oppm:
   CALL   pthis
   DB  13, 10, 'Your search country time is: ', 0 
   
   sub inp1,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
   jmp Exit_code
   
   
japavsban: 
  CALL   pthis
   DB  13, 10, 'Your search country is JAPAN ', 0 

; japan and bangladesh time difference is 2 hour
  mov ax,var4
  mov inp2,ax
  add inp2,2
  cmp inp2,24
  jg llf
  mov ax,inp3 
  jmp pprint
  
 llf:
  sub inp2,24
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0
 pprint:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ooppm 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 ooppm:
   CALL   pthis
   DB  13, 10, 'Your search country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
   jmp Exit_code 
   
   
 austrovsban: 
  CALL   pthis
   DB  13, 10, 'Your search country is AUSTRALIA ', 0 
    ;australia and bangladesh time difference 7 hours
  mov ax,var4
  mov inp2,ax
  add inp2,7
  cmp inp2,24
  jg llff
  mov ax,inp2 
  jmp pprrint
  
 llff:
  sub inp2,24
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0
 pprrint:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ooppm 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
   
 
 germanvsban:
  
   CALL   pthis
   DB  13, 10, 'Your search country is GERMANY ', 0 
   ;german and bangladesh time difference 10 hours
  mov ax,var4
  mov inp2,ax 
  add inp2,10
  cmp inp2,24
  jg kl
  mov ax,inp2 
  jmp ptt
  
 kl:
  sub inp2,24
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0
 ptt:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ooppm 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code

 
 amiricavsban:
 CALL   pthis
   DB  13, 10, 'Your search country is AMERICA ', 0 
   ;anerica and bangladesh time difference 7 hours
  mov ax,var4
  mov inp2,ax
  add inp2,7
  cmp inp2,24
  jg   tk
  mov ax,inp2 
  jmp pptt
  
 tk:
  sub inp2,24
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0
 pptt:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ooppm
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 
       
hindi: 
   
    CALL   pthis
   DB  13, 10, 'Your urrent countryis INDIA ', 0 
   
   mov ah,9
   lea dx,mgs3    ;message for time entering
   int 21h
    
   call scan_num
   mov  inp2,cx
   mov var4,cx
   mov ah,2        ;hour entering with new line
   mov dl,10
   int 21h 
   mov dl,13
   int 21h
   
   call scan_num
   mov  inp3,cx
   mov ah,2
   mov dl,10      ;minute entering with new line
   int 21h 
   mov dl,13
   int 21h  
   
   call scan_num
   mov  inp4,cx
   mov ah,2
   mov dl,10     ;second entering with new line
   int 21h 
   mov dl,13
   int 21h
    
   cmp inp2,24
   jnl error  ;compare input time greater than 24 or not
   cmp inp3,60
   jnl error  ;compare input minute greater than 60 or not
   cmp inp4,60
   jnl error  ;compare input second greater than 60 or not
   
   mov ah,9
   lea dx,mgs2    ;message for query country
   int 21h
   call scan_num
   mov var1,cx 
   
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ppm 
   
   CALL   pthis
   DB  13, 10, 'Your country time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   
   
Lind:
   
 cmp var1,1
 je banvsind

 cmp var1,3
 je japavsind

 cmp var1,4
 je austrovsind

 cmp var1,5
 je germanvsind
                
 cmp var1,6
 je amiricavsind
 
ppm:
  CALL   pthis
   DB  13, 10, 'Your country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
  jmp Lind 
  
 banvsind:
  CALL   pthis
   DB  13, 10, 'Your search country is BANGLADESH ', 0 
  ;bangladesh is 30 minute slower
  add inp3,30
  cmp inp3,60
  jge bi
  mov ax,inp3 
  jmp iop
  
 bi:
  sub inp3,60
  mov ax,inp3
  inc inp2
  cmp inp2,24
  jle iop
  sub inp2,24 
 
 iop:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge oppm 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
   
 japavsind: 
   CALL   pthis
   DB  13, 10, 'Your search country is JAPAN ', 0 
 
   ; japan and india time difference is 1.30 hour
  mov ax,var4
  mov inp2,ax
  add inp2,1
  cmp inp2,24
  jge other
 ; mov ax,inp3
  add inp3,30
  inc inp2
  sub inp3,60  
  jmp po
  
 other:
  add inp3,30
  sub inp2,24
  cmp inp3,60
  jge cng
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0
 po:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge ko 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 ko:
   CALL   pthis
   DB  13, 10, 'Your search country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
   jmp Exit_code
   
 cng:
   sub inp3,60
  inc inp2
  mov ax,inp2 
  jmp po
 austrovsind: 
 CALL   pthis
   DB  13, 10, 'Your search country is AUSTRALIA ', 0 
  
   ; australia and india time difference is 6.30 hour
  mov ax,var4
  mov inp2,ax
  add inp2,6
  cmp inp2,24
  jge pther
 ; mov ax,inp3
  add inp3,30
  inc inp2
  sub inp3,60  
  jmp pl
  
 pther:
  add inp3,30
  sub inp2,24
  cmp inp3,60
  jge cbg
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0  
  
 pl:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge kk 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 kk:
   CALL   pthis
   DB  13, 10, 'Your search country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
   jmp Exit_code
   
 cbg:
   sub inp3,60
  inc inp2
  mov ax,inp2 
  jmp pl
  
 germanvsind:
  CALL   pthis
   DB  13, 10, 'Your search country is GERMANY ', 0 
  ; australia and india time difference is 8.30 hour
  mov ax,var4
  mov inp2,ax
  add inp2,8
  cmp inp2,24
  jge pthery
 ; mov ax,inp3
  add inp3,30
  inc inp2
  sub inp3,60  
  jmp pnh
  
 pthery:
  add inp3,30
  sub inp2,24
  cmp inp3,60
  jge ccul
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0  
  
 pnh:
   
   cmp inp2,12    ;compare input time greater than 12 or not
   jge kuo 
   
   CALL   pthis
   DB  13, 10, 'Your search time is: ', 0
    
 
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num         ;code for print am
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' AM', 0 
   jmp Exit_code
 kuo:
   CALL   pthis
   DB  13, 10, 'Your search country time is: ', 0 
   
   sub inp2,12
   mov ax,inp2
   call print_num
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp3
   call print_num             ;code for print pm
   
   CALL   pthis
   DB  '-', 0
   mov ax,inp4
   call print_num
   
   CALL   pthis
   DB  ' PM', 0 
   jmp Exit_code
   
 ccul:
   sub inp3,60
  inc inp2
  mov ax,inp2 
  jmp pnh
  
 
 amiricavsind:
   CALL   pthis
   DB  13, 10, 'Your search country is AMERICA ', 0 
   ; australia and india time difference is 9.30 hour
  mov ax,var4
  mov inp2,ax
  add inp2,9
  cmp inp2,24
  jge prt
 ; mov ax,inp3
  add inp3,30
  inc inp2
  sub inp3,60  
  jmp pnh
  
 prt:
  add inp3,30
  sub inp2,24
  cmp inp3,60
  jge ccul
  mov ax,inp2
  CALL   pthis
  DB  13, 10, 'This is next day', 0  
  
  jmp pnh
 
 

japa: 

austro:
 
german:
  
amirica:
error:
   CALL   pthis
   DB  10,13,'Error !! this time is not possible', 0

Exit_code:

   
   mov ah,4ch
   end main
   main endp
  