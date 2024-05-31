.model small 
.stack 100h
.data 
    nl db 13,10,"$"
.code
    start:
        mov ax,@data
        mov ds,ax
        
   
        
        
        mov ah,1
        int 21h
        sub al,48
        
        mov ch,10
        mov cl,0 
        mov bh,al
        mov bl,01h
        
        l1:
           lea dx,nl
           mov ah ,9
           int 21h 
           
           mov dl,bh
           add dl,48
           mov ah,2
           int 21h
           
           mov dl,"*"
           int 21h
           
           mov al,bl
           mul bh
           aam
           push ax
           
           mov ah,00h
           mov al,bl
           aaa
           
           mov cl,ah
           mov bl,al 
           
           mov dl,cl
           add dl,30h
           mov ah,2h
           int 21h 
           
           mov dl,bl
           add dl,30h
           mov ah,2h
           int 21h
           
           
          
           
           mov dl,'='
           int 21h
           
           pop ax 
           
           mov dh,al
           mov dl,ah
           add dl,48
           add dh,48
           
           mov ah,2
           int  21h
           mov dl,dh
           int 21h
           
           inc bl
           dec ch
           cmp ch,0
           jne l1
     exit:
         mov ah,4ch
         int 21h
           
