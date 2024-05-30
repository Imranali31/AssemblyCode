.MODEL SMALL
.STACK 100
.DATA
.CODE
main proc
     MOV AH ,1
     INT 21H
     push ax       
     mov dx,0dh
     mov ah,2
     int 21h
     mov dx,0ah
     mov ah,2
     int 21h
     pop dx
     
     MOV AH,2
     INT 21H
    
     MOV AH,4CH
     INT 21H  
     
main endp
END   