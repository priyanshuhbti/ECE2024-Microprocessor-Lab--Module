.MODEL SMALL
.STACK 100H

.DATA
ARRAY DB 5, 9, 4, 6, 7
N EQU 5

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, N
OUTER_LOOP:
    MOV SI, 0
    MOV BX, N
    DEC BX
INNER_LOOP:
    MOV AL, ARRAY[SI]
    CMP AL, ARRAY[SI+1]
    JLE NO_SWAP
    XCHG AL, ARRAY[SI+1]
    MOV ARRAY[SI], AL
NO_SWAP:
    INC SI
    DEC BX
    JNZ INNER_LOOP
    LOOP OUTER_LOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
