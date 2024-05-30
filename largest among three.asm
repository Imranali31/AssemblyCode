.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1 
    int 21h
    mov bh,al
    int 21h
    mov bl,al
    
    int 21h
    mov ch,al
    
    cmp bh,bl 
    jg big_ax
    mov bh,bl
big_ax:
    cmp bh,ch
    jg print_big
    mov bh,ch
    
    print_big:
        mov ah,2
        mov dl,bh
        int 21h
        
        
    mov ah,04ch
    int 21h
main endp
end
    
    
    
    