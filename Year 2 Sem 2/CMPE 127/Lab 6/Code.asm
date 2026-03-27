.686p
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
.code
    mov ax, @data
    mov ds, ax

    ; 1. DAA: AL=05h, BL=05h, ADD AL, BL
    mov ax, 0       ; Clear AX
    mov al, 05h
    mov bl, 05h
    add al, bl      ; AL = 0Ah (10 decimal)
    daa             ; Adjusts AL to 10h (Valid BCD for 10)

    ; 2. DAS: AL=20h, BL=05h, SUB AL, BL
    mov ax, 0
    mov al, 20h
    mov bl, 05h
    sub al, bl      ; AL = 1Bh 
    das             ; Adjusts AL to 15h (Valid BCD for 15)

    ; 3. AAA: AL=35h, BL=32h, ADD AL, BL
    mov ax, 0
    mov al, 35h
    mov bl, 32h
    add al, bl      ; AL = 67h
    aaa             ; Adjusts AL to 07h, AH = 00h (Unpacked BCD)

    ; 4. AAS: AL=38h, BL=32h, SUB AL, BL
    mov ax, 0
    mov al, 38h
    mov bl, 32h
    sub al, bl      ; AL = 06h
    aas             ; Adjusts AL to 06h, AH = 00h

    ; 5. AAS (with borrow): AL=32h, BL=38h, SUB AL, BL
    mov ax, 0
    mov al, 32h
    mov bl, 38h
    sub al, bl      ; AL = FAh (-6 in 2's complement)
    aas             ; Adjusts AL to 04h, decrements AH to FFh, CF=1

    ; 6. AAM: AL=11d, BL=03d, MUL BL
    mov ax, 0
    mov al, 11      ; 11 decimal = 0Bh
    mov bl, 3       ; 3 decimal = 03h
    mul bl          ; AX = 0021h (33 decimal)
    aam             ; Divides AL by 10: AH=03h, AL=03h (Unpacked BCD 3, 3)

    ; 7. AAD, DIV, DAA: AX=0408h, BL=04h
    mov ax, 0408h   ; Unpacked BCD 48 (AH=04h, AL=08h)
    mov bl, 04h
    aad             ; AL = (4*10)+8 = 48 (30h), AH = 00h
    div bl          ; AL = 30h / 4 = 0Ch (12 decimal)
    daa             ; Adjusts AL to 12h (Valid BCD for 12)

    mov ax, 0
    mov al, 50      ; Decimal 50 = 32h
    mov bl, 50      ; Decimal 50 = 32h
    mul bl          ; AX = 09C4h (2500 decimal)

    invoke ExitProcess, 0
main endp
end main