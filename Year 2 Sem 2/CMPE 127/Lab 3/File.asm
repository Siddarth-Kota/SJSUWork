.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
.code
main proc

MOV AL, 0FFh
MOV BL, 1h
ADD AL, BL

    invoke ExitProcess, 0
main endp
end main