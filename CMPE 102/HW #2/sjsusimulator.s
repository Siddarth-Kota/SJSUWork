#
# This is the skeleton program for CMPE 102 assignment 2
#
# gcc -g sjsusimulator.s -o sjsusimulator.exe
#
.global  main
.data
ten: .long 10
counter: .long 0
itoa_string: .ascii "          \n"
sjsuprompt: .ascii "(sjsu) "
instruction: .ascii "                "
ilen: .long 0
alu: .long 0
hex_string: .ascii "0x00000000\n"

.text
main:
#   similar to eax = write(1,"(sjsu) "
    mov    $4,%eax
    mov    $1,%ebx
    mov    $sjsuprompt,%ecx
    mov    $7,%edx
    int    $0x80

#   similar to eax = read(0,instruction,16)
    mov    $3,%eax
    mov    $0,%ebx
    mov    $instruction,%ecx
    mov    $16,%edx
    int    $0x80

    dec    %eax
    mov    %eax,ilen

    cmpl   $0x20766f6d,instruction	# cmpl "mov ",instruction in hex
    je     do_mov
    cmpl   $0x20646461,instruction	# cmpl "add ",instruction in hex
    je     do_add
    cmpl   $0x206c756d,instruction	# cmpl "mul ",instruction in hex
    je     do_mul
    cmpl   $0x20627573,instruction      # cmpl "sub ",instruction in hex
    je     do_sub
    cmpl   $0x206f7571,instruction      # cmpl "quo ",instruction in hex
    je     do_quo
    cmpl   $0x206d6572,instruction      # cmpl "rem ",instruction in hex
    je     do_rem
    cmpl   $0x206d7573,instruction      # cmpl "sum ",instruction in hex
    je     do_sum
    cmpl   $0x0a6d7573,instruction      # cmpl "sum\n ",instruction in hex
    je     do_sum

    jmp     main

do_mov:
    call   atoi				# calling atoi() to convert instruction+4 to binary
    mov    counter,%eax			# placing atoi result from counter to eax
    mov    %eax,alu			# placing eax to variable alu
    call   itoa				# calling itoa() to convert alu to string
#   eax = write(1,itoa_string,11)
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main				# jumps back to label main for another instruction

do_add:
    call   atoi
    mov    counter,%eax
    add    %eax,alu			# add operand to alu
    movl   alu, %eax			# copy alu to eax
    movl   %eax,counter			# copy eax to counter to be converted to string
#   eax = write(1,itoa_string,11)
    call   itoa
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main				# jumps back to label main for another instruction

do_mul:
    call   atoi
    mov    counter,%eax
    imul   alu,%eax
    mov    %eax,alu
    mov    %eax,counter
    call   itoa
#   eax = write(1,itoa_string,11)
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main				# jumps back to label main for another instruction

do_sub:
    call   atoi
    mov    counter,%eax
    sub    %eax,alu                     # sub operand to alu
    movl   alu, %eax                    # copy alu to eax
    movl   %eax,counter                 # copy eax to counter to be converted to string
#   eax = write(1,itoa_string,11)
    call   itoa
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main                         # jumps back to label main for another instruction

do_quo:
    call   atoi
    mov    counter,%ebx              # EBX = divisor
    mov    alu,%eax                  # EAX = dividend
    test   %ebx,%ebx
    jz     quo_print
    cdq
    idivl  %ebx                      # EAX = quotient, EDX = remainder
    mov    %eax,alu

quo_print:
    mov    alu,%eax
    mov    %eax,counter
#   eax = write(1,itoa_string,11)
    call   itoa
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main

do_rem:
    call   atoi
    mov    counter,%ebx              # EBX = divisor
    mov    alu,%eax                  # EAX = dividend
    test   %ebx,%ebx
    jz     rem_print
    cdq
    idivl  %ebx                      # EAX = quotient, EDX = remainder
    mov    %edx,alu

rem_print:
    mov    alu,%eax
    mov    %eax,counter
#   eax = write(1,itoa_string,11)
    call   itoa
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main

do_sum:
    mov    alu,%eax
    cmp    $0,%eax
    jl     sum_neg

#if m is not negative
    mov    %eax,%ebx                 # EBX = n
    mov    %eax,%ecx                 # ECX = n
    inc    %ecx                      # ECX = n+1
    imul   %ecx,%ebx                 # EBX = n*(n+1)
    mov    %ebx,%eax                 # EAX = product
    cdq                               # sign-extend into EDX:EAX
    mov    $2,%esi                   # divisor = 2
    idivl  %esi                      # EAX = product/2
    mov    %eax,alu
    jmp    sum_print

sum_neg:
#if m is negative
    neg    %eax                      # EAX = |n|
    mov    %eax,%ebx                 # EBX = |n|
    mov    %eax,%ecx                 # ECX = |n|
    inc    %ecx                      # ECX = |n|+1
    imul   %ecx,%ebx                 # EBX = |n|*(|n|+1)
    mov    %ebx,%eax                 # EAX = product
    cdq
    mov    $2,%esi
    idivl  %esi                      # EAX = product/2
    neg    %eax                      # -(triangular)
    mov    %eax,alu

sum_print:
    mov    alu,%eax
    mov    %eax,counter
#   eax = write(1,itoa_string,11)
    call   itoa
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_hex
    jmp    main

# exit here
    mov    $1,%eax
    mov    $0,%ebx
    int    $0x80
#   Function atoi() to convert an ascii string like "mov 125" in variable instruction into binary 125, in variable counter
atoi:
    mov    ilen,%esi			# set esi to the length of instruction variable
    dec    %esi				# decrement by 1 to point at the last byte
    mov    $1,%ebx			# using ebx as the scale factor, starting from 1 or 10^0, then 10^1,10^2,etc
    movl   $0,counter    		# initialize the result counter to 0
atoi_loop:
    mov    $0,%eax
    movb   instruction(%esi),%al	# eax = instruction[esi]
    subb   $'0',%al			# convert from character like '0' to binary like 0
    imull  %ebx				# multiply eax by the scaling factor in ebx
    add    %eax,counter			# add the value of one digit to the counter
    imull   $10,%ebx,%ebx		# multiply the scaling factor by 10, to get 1,10,100,etc
    dec    %esi				# esi = esi -1, moving to right
    cmpl   $4,%esi			# Have we reached index 4 (the space) of "mov 125"
    jge    atoi_loop			# not yet, jump back
    ret
#   Function itoa() to convert integer variable counter's value to ASCII characters, placed in variable itoa_string.

itoa:
#   copy counter to %eax to prepare for division
    mov    counter,%eax
#   copy 10 spaces to itoa_string
    movl   $0x20202020,itoa_string
    movl   $0x20202020,itoa_string+4
    movw   $0x2020,itoa_string+8
#   point %edi index register to the last byte of itoa_string, think:
#   char *itoa_string="    ";
#   char *edi = &itoa_string[9];
    lea    itoa_string+9,%edi
    xor    %ebx,%ebx

    cmp    $0,%eax
    jne    itoa_nonzero

    movb   $'0',(%edi)
    ret

itoa_nonzero:
    jns    itoa_abs
    neg    %eax
    mov    $1, %ebx

itoa_abs:
itoa_loop:
    xor    %edx,%edx
    divl   ten
    addl   $'0',%edx	# convert from binary 0 (or 1-9) to '0' (or '1'-'9')
    movb   %dl,(%edi)	# think: *(edi) = '0'
    dec    %edi		# think: edi--;
    test   %eax,%eax
    jnz    itoa_loop

    cmp    $0,%ebx
    je     itoa_done
    movb   $'-',(%edi)
itoa_done:
    ret

itoh:
    mov    counter,%eax
    lea    hex_string+9,%edi         # write last hex digit backward
    mov    $8,%ecx
itoh_loop:
    mov    %eax,%ebx
    and    $0xF,%ebx
    cmp    $10,%ebx
    jl     itoh_dig
    add    $('a'-10),%ebx
    jmp    itoh_store
itoh_dig:
    add    $'0',%ebx
itoh_store:
    movb   %bl,(%edi)
    dec    %edi
    shrl   $4,%eax
    dec    %ecx
    jnz    itoh_loop
    ret

print_hex:
    push   %eax
    push   %ebx
    push   %ecx
    push   %edx
    push   %esi
    push   %edi

    call   itoh                       # fills hex_string from 'counter'

    mov    $4,%eax                    # write(1, hex_string, 11)
    mov    $1,%ebx
    mov    $hex_string,%ecx
    mov    $11,%edx
    int    $0x80

    pop    %edi
    pop    %esi
    pop    %edx
    pop    %ecx
    pop    %ebx
    pop    %eax
    ret
