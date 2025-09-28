#
# This is the skeleton program for CMPE 102 assignment 1
#
# gcc -g vending.s -o vending.exe
#
.global  main
.data
ten: .long 10
itoa_string: .ascii "    "
msg:
    .ascii "\nenter coin choice (q/Q,d/D,n/N):" # length 34
    len = . - msg 	# setting len to current position - position of msg = 34
end:
    .ascii "end change:"
    endlen = . - end
change:
    .ascii "change:"
    changelen = . - change
nl:
    .ascii "\n"
    nllen = . - nl
cents:
    .ascii " cents"
    centslen = . - cents
coinchoice:
    .ascii "    "
counter: .long 0
.text
main:
#   similar to eax = write(1,"\nenter coin choice (q/Q,d/D,n/N):",34)
    mov    $4,%eax
    mov    $1,%ebx
    mov    $msg,%ecx
    mov    $len,%edx
    int    $0x80
#   similar to eax = read(0,&coinchoice,2)
    mov    $3,%eax
    mov    $0,%ebx
    mov    $coinchoice,%ecx
    mov    $2,%edx
    int    $0x80

#   if coinchoice == 'q' jump to add25 to add 25 to counter and print the new value
    cmpb   $'q',coinchoice
    je     add25
#   if coinchoice == 'Q' jump to add25 to add 25 to counter and print the new value
    cmpb   $'Q',coinchoice
    je     add25
#   if coinchoice == 'd' jump to add10 to add 10 to counter and print the new value
    cmpb   $'d',coinchoice
    je     add10
#   if coinchoice == 'D' jump to add10 to add 10 to counter and print the new value
    cmpb   $'D',coinchoice
    je     add10
#   if coinchoice == 'n' jump to add5 to add 5 to counter and print the new value
    cmpb   $'n',coinchoice
    je     add5
#   if coinchoice == 'N' jump to add5 to add 5 to counter and print the new value
    cmpb   $'N',coinchoice
    je     add5

#   if invalid input
    call call_exit
add25:
    add    $25,counter
    # call itoa(counter,itoa_string) - converts the integer in counter to ascii in itoa_string
    call   print_out
    call   itoa		# jump to the label itoa, which will return to next instruction
    # after calling itoa, print out the counter value in itoa_string
    call   printitoa
    jmp    main
# exit here
add10:
    add    $10,counter
    # call itoa(counter,itoa_string) - converts the integer in counter to ascii in itoa_string
    call   print_out
    call   itoa         # jump to the label itoa, which will return to next instruction
    # after calling itoa, print out the counter value in itoa_string
    call   printitoa
    jmp    main
# exit here
add5:
    add    $5,counter
    # call itoa(counter,itoa_string) - converts the integer in counter to ascii in itoa_string
    call   print_out
    call   itoa         # jump to the label itoa, which will return to next instruction
    # after calling itoa, print out the counter value in itoa_string
    call   printitoa
    jmp    main
# exit here
call_exit:

#   print end change
    mov    $4,%eax
    mov    $1,%ebx
    mov    $end,%ecx
    mov    $endlen,%edx
    int    $0x80

    call   itoa
    call   printitoa

    mov    $4,%eax
    mov    $1,%ebx
    mov    $nl,%ecx
    mov    $nllen,%edx
    int    $0x80

    mov    $1,%eax
    mov    $0,%ebx
    int    $0x80

#   Function itoa() to convert integer variable counter's value to ASCII characters, placed in variable itoa_string.
itoa:
#   copy counter to %eax to prepare for division
    mov    counter,%eax
#   copy four spaces to itoa_string
    movl   $0x20202020,itoa_string
#   point %edi index register to the last byte of itoa_string, think:
#   char *itoa_string="    ";
#   char *edi = &itoa_string[3];
    lea    itoa_string+3,%edi
itoa_loop:
    mov    $0,%edx
    idivl  ten
    addl   $'0',%edx	# convert from binary 0 (or 1-9) to '0' (or '1'-'9')
    movb   %dl,(%edi)	# think: *(edi) = '0'
    dec    %edi		# think: edi--;
    cmpl   $0,%eax
    jg     itoa_loop
    ret			# ret: returns/jumps to the instruction after CALL itoa
print_out:
    mov    $4,%eax
    mov    $1,%ebx
    mov    $change,%ecx
    mov    $changelen,%edx
    int    $0x80
    ret
printitoa:
    lea    1(%edi), %ecx
    mov    $itoa_string+4, %edx
    sub    %ecx, %edx

    mov    $4, %eax
    mov    $1, %ebx
    int    $0x80

#   write "cents"
    mov    $4, %eax
    mov    $1, %ebx
    mov    $cents, %ecx
    mov    $centslen, %edx
    int    $0x80
    ret
