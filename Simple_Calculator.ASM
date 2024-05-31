.MODEL SMALL
.STACK 100H
.DATA 
    MSG1: DB 13,10,"1-ADD",13,10,"2-SUBSTRACT",13,10,"3-MULTIPLY",13,10,"4-DIVISION",13,10,"$"
    MSG2 DB 13,10,"Enter first number: $"
    MSG3 DB 13,10,"Enter SECOND number: $" 
    MSG4 DB 13,10,"RESULT: $" 
    MSG5 DB 13,10,"ERROR CHOICE $"
.CODE
START :
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    CMP AL,49
    JE ADDI
    CMP AL,50
    JE SUBS
    CMP AL,51
    JE MULTI
    CMP AL,52
    JE DIVI 
    
    LEA DX,MSG5
    MOV AH,09
    INT 21H
    JMP EXIT
ADDI:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,1
    INT 21H
    MOV BX,AX
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV AH,1
    INT 21H
    ADD AX,BX
    AAA
    MOV BX,AX
    
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,46
    INT 21H
    MOV DL,BL
    ADD DL,48
    INT 21H
    
    JMP EXIT 
SUBS:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,1
    INT 21H
    MOV BX,AX
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV AH,1
    INT 21H 
    CMP BX,AX
    JL MIN
    
    SUB BX,AX      
 
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    ADD DL,48
    INT 21H
    JMP EXIT
    
    MIN:
    
      SUB AX,BX 
      MOV BX,AX
      MOV AH,9
      LEA DX,MSG4
      INT 21H
      
      MOV AH,2
      MOV DL,45
      INT 21H
      MOV DL,BL
      ADD DL,48
      INT 21H
      JMP EXIT
MULTI:
     MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AL,48
    MOV BL,AL
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AL,48
    
    MUL BL 
    AAM 
    MOV BX,AX
     
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,48
    INT 21H
    MOV DL,BL
    ADD DL,48
    INT 21H
    
    JMP EXIT 
DIVI:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,48 
    MOV AH,0
    MOV BH,0
    PUSH AX
    MOV AX,BX
    POP BX
    DIV BL
    MOV AH,0 
    MOV BL,AL
    AAD
    
    MOV BX,AX
    MOV AH,9
    LEA DX, MSG4
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,48
    INT 21H
    
    MOV DL,BL
    ADD DL,48
    INT 21H      

EXIT:
    MOV AH,4CH
    INT 21H
       