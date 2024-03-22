;write a assembly language programming using emu8086
; Develop a menu using different colors and navigate between the items in the
;menu using arrow keys using int�10�functions.


include 'emu8086.inc'
main:

    call displayMenu      ; Display the menu

    
;Navigation
; UP 48H
;DOWN 50H
;LEFT 4BH
;RIGHT 4DH    
    MOV DH,8H             ;Row
    MOV DL,46            ;Column
Nav:
    CMP DH,4H
    JNE T1
        MOV DH,8H
    T1:
    CMP DH,9H
    JNE T2
        MOV DH,5H
    T2:
    MOV BH,0              ;set pagenumber
    MOV AH,2
    INT 10H
    
    MOV AX,0              ;press key
    INT 16H 
    CMP AH,1CH          ;COMPARE WITH ENTER
    JNE NOT_ENT 
         JMP DISPLAY
    NOT_ENT:
        CMP AH,48H            ;compare with up bios key
        JNE NOT_UP
        
        DEC DH                ;decrement row (move up)
        MOV AH,2
        INT 10H
        JMP OVER
    NOT_UP:
        CMP AH,50H        ;compare with down bios key
        JNE NOT_DOWN
         
        INC DH            ;increment row  (move down)
        MOV AH,2
        INT 10H
         
        JMP OVER
    NOT_DOWN:
        CMP AH,4BH        ;compare with left bios key
        JNE NOT_LEFT
         
        DEC DL            ;decrement column (move left)
        MOV AH,2
        INT 10H
     
        JMP OVER
    NOT_LEFT:
        CMP AH,4DH        ;compare with right bios key
        JNE NOT_RIGHT
         
        INC DL            ;increment column(move right)
        MOV AH,2
        INT 10H
         
        JMP OVER
    NOT_RIGHT:
    OVER:
        NOP
        MOV CH, 0
        MOV CL, 7
        MOV AH, 1          ;PRESS KEY
        INT 10H 
        JMP Nav
    ;mov ax,0              
;    int 16h
;    cmp ah,1ch
;    jne Nav    
    
DISPLAY:
       CMP DH,5H
       JNE NOT_1
                           
             MOV SI, offset DIS1
             mov DI, 20      ; Initial column position 
            MENU1:
              ; Set cursor position
              MOV AH, 02h
              MOV BH, 00h    ; Set page number
              MOV DX, DI     ; COLUMN number in low BYTE
              MOV DH, 15H      ; ROW number in high BYTE
              INT 10h
              LODSB          ; load current character from DS:SI to AL and increment SI
              CMP AL, '$'    ; Is string-end reached?
              JE  finAL1        ; If yes, continue
              ; Print current char
              MOV AH,09H
              MOV BH, 0      ; Set page number
              MOV BL,15      ;color
              MOV CX, 1      ; Character count
              INT 10h
              INC DI         ; Increase column position
              jmp MENU1
            finAL1:
              JMP OVR 
                
             
             
       NOT_1:
            CMP DH,6H
            JNE NOT_2
            
            MOV SI, offset DIS2
             mov DI, 20      ; Initial column position 
            MENU2:
              ; Set cursor position
              MOV AH, 02h
              MOV BH, 00h    ; Set page number
              MOV DX, DI     ; COLUMN number in low BYTE
              MOV DH, 15H      ; ROW number in high BYTE
              INT 10h
              LODSB          ; load current character from DS:SI to AL and increment SI
              CMP AL, '$'    ; Is string-end reached?
              JE  finAL2        ; If yes, continue
              ; Print current char
              MOV AH,09H
              MOV BH, 0      ; Set page number
              MOV BL,15      ;color
              MOV CX, 1      ; Character count
              INT 10h
              INC DI         ; Increase column position
              jmp MENU2
            finAL2:
              JMP OVR
            
       NOT_2:
            CMP DH,7H
            JNE NOT_3 
            
            MOV SI, offset DIS3
             mov DI, 20      ; Initial column position 
            MENU3:
              ; Set cursor position
              MOV AH, 02h
              MOV BH, 00h    ; Set page number
              MOV DX, DI     ; COLUMN number in low BYTE
              MOV DH, 15H      ; ROW number in high BYTE
              INT 10h
              LODSB          ; load current character from DS:SI to AL and increment SI
              CMP AL, '$'    ; Is string-end reached?
              JE  finAL3        ; If yes, continue
              ; Print current char
              MOV AH,09H
              MOV BH, 0      ; Set page number
              MOV BL,15      ;color
              MOV CX, 1      ; Character count
              INT 10h
              INC DI         ; Increase column position
              jmp MENU3
            finAL3:
              JMP OVR
            
       NOT_3:
            CMP DH,8H
            JNE NOT_4 
            
            MOV SI, offset DIS4
             mov DI, 20      ; Initial column position 
            MENU4:
              ; Set cursor position
              MOV AH, 02h
              MOV BH, 00h    ; Set page number
              MOV DX, DI     ; COLUMN number in low BYTE
              MOV DH, 15H      ; ROW number in high BYTE
              INT 10h
              LODSB          ; load current character from DS:SI to AL and increment SI
              CMP AL, '$'    ; Is string-end reached?
              JE  finAL4        ; If yes, continue
              ; Print current char
              MOV AH,09H
              MOV BH, 0      ; Set page number
              MOV BL,15      ;color
              MOV CX, 1      ; Character count
              INT 10h
              INC DI         ; Increase column position
              jmp MENU4
            finAL4:
              JMP OVR
       NOT_4:
       OVR:
            MOV AH,0
            INT 21H
      

displayMenu:
      MOV SI, offset menuItem1
      mov DI, 30      ; Initial column position 
    lop1:
      ; Set cursor position
      MOV AH, 02h
      MOV BH, 00h    ; Set page number
      MOV DX, DI     ; COLUMN number in low BYTE
      MOV DH, 5      ; ROW number in high BYTE
      INT 10h
      LODSB          ; load current character from DS:SI to AL and increment SI
      CMP AL, '$'    ; Is string-end reached?
      JE  fin1        ; If yes, continue
      ; Print current char
      MOV AH,09H
      MOV BH, 0      ; Set page number
      MOV BL,9      ;color
      MOV CX, 1      ; Character count
      INT 10h
      INC DI         ; Increase column position
      jmp lop1
    fin1:
      ; ... 
    
      
    MOV SI, offset menuItem2
      mov DI, 30      ; Initial column position 
    lop2:
      ; Set cursor position
      MOV AH, 02h
      MOV BH, 00h    ; Set page number
      MOV DX, DI     ; COLUMN number in low BYTE
      MOV DH, 6      ; ROW number in high BYTE
      INT 10h
      LODSB          ; load current character from DS:SI to AL and increment SI
      CMP AL, '$'    ; Is string-end reached?
      JE  fin2        ; If yes, continue
      ; Print current char
      MOV AH,09H
      MOV BH, 0      ; Set page number
      MOV BL,10       ;color
      MOV CX, 1      ; Character count
      INT 10h
      INC DI         ; Increase column position
      jmp lop2
    fin2:
      ; ...  
      
      
    MOV SI, offset menuItem3
      mov DI, 30      ; Initial column position 
    lop3:
      ; Set cursor position
      MOV AH, 02h
      MOV BH, 00h    ; Set page number
      MOV DX, DI     ; COLUMN number in low BYTE
      MOV DH, 7      ; ROW number in high BYTE
      INT 10h
      LODSB          ; load current character from DS:SI to AL and increment SI
      CMP AL, '$'    ; Is string-end reached?
      JE  fin3        ; If yes, continue
      ; Print current char
      MOV AH,09H
      MOV BH, 0      ; Set page number
      MOV BL,13
      MOV CX, 1      ; Character count
      INT 10h
      INC DI         ; Increase column position
      jmp lop3
    fin3:
      ; ...
             
    printn         
    MOV SI, offset menuItem4
      mov DI, 30      ; Initial column position 
    lop4:
      ; Set cursor position
      MOV AH, 02h
      MOV BH, 00h    ; Set page number
      MOV DX, DI     ; COLUMN number in low BYTE
      MOV DH, 8      ; ROW number in high BYTE
      INT 10h
      LODSB          ; load current character from DS:SI to AL and increment SI
      CMP AL, '$'    ; Is string-end reached?
      JE  fin4        ; If yes, continue
      ; Print current char
      MOV AH,09H
      MOV BH, 0      ; Set page number
      MOV BL,14       ;color
      MOV CX, 1      ; Character count
      INT 10h
      INC DI         ; Increase column position
      jmp lop4
    fin4:
      ; ...             

ret    


 menuItem1     db  "HARDWARE      --1$"
 menuItem2     db  "SOFTWARE      --2$"
 menuItem3     db  "COMPUTER      --3$"
 menuItem4     db  "SUPER COMPUTER--4$"  
 DIS1 DB "****OPTION-1 HARDWARE IS SELECTED****$"  
 DIS2 DB "****OPTION-2 SOFTWARE IS SELECTED****$"
 DIS3 DB "****OPTION-3 COMPUTER IS SELECTED****$"
 DIS4 DB "****OPTION-4 SUPER COMPUTER IS SELECTED****$" 
; col1  db  1,2,3,4  ; Define colors for menu items (1-4 represent different colors)
    selectedItem db 0         ; Variable to keep track of selected menu item