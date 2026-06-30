Include Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
radius WORD 5
msg BYTE "Perimeter: ", 0
two REAL4 2.0

.code
main proc
    mov edx, offset msg
    call WriteString

    fild radius     ;reads the radius, converts it to a float, and pushes it onto the FPU stack
    fldpi           ;pushed the value of pi onto the FPU stack
    fmul            ;multiplies the top 2 values on the FPU stack
    fld two         ;pushes 2 onto the FPU stack
    fmul            ;multiplies 2 * (pi*radius) to complete the equation

    call WriteFloat
    call Crlf

    invoke ExitProcess, 0
main endp
end main