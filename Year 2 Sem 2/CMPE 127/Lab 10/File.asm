include Irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
mymsg byte "level", 0
reversemsg byte lengthof mymsg DUP (0) ; initialize array as same size of mymsg

isPalin byte " is a palindrome.", 0
notPalin byte " is not a palindrome.", 0

.code
main proc
    mov edx, offset mymsg  ; give offset for calling WriteString
    call WriteString
    
    mov ebx, offset mymsg  ; initialize base variables for push loop
    mov esi, 0
    mov ecx, lengthof mymsg - 1

push_next:
    mov eax, 0
    mov al, [ebx + esi]
    push ax                ; push ax to the stack
    inc esi
    loop push_next

    mov ebx, offset reversemsg ; initialize base variables for pop loop
    mov ecx, lengthof mymsg - 1
    mov esi, 0

pop_next:
    pop ax                 ; pop top of stack into ax
    mov [ebx + esi], al
    inc esi
    loop pop_next

    mov esi, 0
    mov ecx, lengthof mymsg - 1
    mov ebx, offset mymsg
    mov edi, offset reversemsg

compare_loop:
    mov al, [ebx + esi]     ;get character from mymsg
    mov dl, [edi + esi]     ;get character from reversemsg
    cmp al, dl              ;compare characters
    jne not_palindrome      ;if not equal, msg is not a palindrome
    inc esi
    loop compare_loop       ;keep looping until all characters are compared

    mov edx, offset isPalin
    call WriteString
    call Crlf
    jmp end_program

not_palindrome:
    mov edx, offset notPalin
    call WriteString
    call Crlf

end_program:
    invoke ExitProcess, 0
main endp
End main