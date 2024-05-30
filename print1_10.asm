.MODEL SMALL
.STACK 100
.CODE
   MOV CX,10
   MOV DX,48

   L1:
     MOV AH,2
     INT 21H
     INC DX
   LOOP L1

   MOV AH,4CH
   INT 21H
END