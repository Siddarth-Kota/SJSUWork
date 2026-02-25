.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
sum WORD ?
var1 WORD 5

.code
main proc
    ; Immediate and Register Modes
    MOV AX, 0FFFFh       
    MOV BX, 7h           
    ADD AX, BX           
    CLC                  
    
    ; Direct Addressing Mode
    MOV sum, AX          
    MOV AX, BX           
    
; Register Indirect Mode
    LEA EBX, var1        
    MOV AX, [EBX]        
    
    ; Indexed Mode 
    MOV ESI, OFFSET sum  
    MOV BX, [ESI+02]     
    
    ; Based-Indexed Mode (FIXED)
    MOV EBX, OFFSET sum  ; 1. Set EBX as the Base Address of 'sum'
    MOV ESI, 2           ; 2. Set ESI as the Index (2 bytes to skip over 'sum')
    MOV CX, [EBX+ESI]    ; 3. EBX + ESI safely calculates the address of 'var1'

    invoke ExitProcess, 0
main endp
end main