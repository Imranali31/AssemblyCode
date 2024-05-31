.model small
.stack 100h
.data  
    num1 db ?
    nl db 0dh,0ah,"$"
.code
start:  
    mov ax,@data
    mov ds,ax
    mov ah,1  
    int 21h   
    sub al,48
    mov num1,al
    
    int 21h
    sub al,48
    mul num1
    aam 
    
    add ah,48
    add al,48
    
    mov bx,ax
    
    lea dx,nl
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h 

    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21
    
