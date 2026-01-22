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
itob_string: .ascii "                                  \n"

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

    cmpl   $0x20766f6d,instruction	# "mov "
    je     do_mov
    cmpl   $0x20646461,instruction	# "add "
    je     do_add
    cmpl   $0x206c756d,instruction	# "mul "
    je     do_mul
    cmpl   $0x20627573,instruction      # "sub "
    je     do_sub
    cmpl   $0x206f7571,instruction      # "quo "
    je     do_quo
    cmpl   $0x206d6572,instruction      # "rem "
    je     do_rem
    cmpl   $0x206d7573,instruction      # "sum "
    je     do_sum
    cmpl   $0x0a6d7573,instruction      # "sum\\n"
    je     do_sum

    cmpl   $0x206c6f72,instruction      # "rol "
    je     do_rol
    cmpl   $0x20726f72,instruction      # "ror "
    je     do_ror
    cmpl   $0x206c6173,instruction      # "sal "
    je     do_sal
    cmpl   $0x20726173,instruction      # "sar "
    je     do_sar
    cmpl   $0x20646e61,instruction      # "and "
    je     do_and
    cmpl   $0x20726f78,instruction      # "xor "
    je     do_xor
    cmpl   $0x0a746f6e,instruction      # "not\\n"
    je     do_not
# "or " is 3 bytes; compare 'or' and then the space
    cmpw   $0x726f,instruction
    jne    not_or
    cmpb   $' ',instruction+2
    je     do_or
not_or:
    jmp     main

do_mov:
    call   atoi				# parse operand (decimal or 0b...)
    mov    counter,%eax			# atoi result to eax
    mov    %eax,alu			# alu = eax
    call   itoa				# convert alu (via counter) to decimal string
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

do_add:
    call   atoi
    mov    counter,%eax
    add    %eax,alu			# alu += operand
    movl   alu, %eax
    movl   %eax,counter
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

do_mul:
    call   atoi
    mov    counter,%eax
    imul   alu,%eax
    mov    %eax,alu
    mov    %eax,counter
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

do_sub:
    call   atoi
    mov    counter,%eax
    sub    %eax,alu                     # alu -= operand
    movl   alu, %eax
    movl   %eax,counter
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

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
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
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
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
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
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

do_rol:
    call   atoi                      # count (decimal or 0b...)
    mov    alu,%eax
    mov    counter,%ecx              # CL = count
    roll   %cl,%eax
    mov    %eax,alu
    jmp    print_after_op

do_ror:
    call   atoi
    mov    alu,%eax
    mov    counter,%ecx
    rorl   %cl,%eax
    mov    %eax,alu
    jmp    print_after_op

do_sal:
    call   atoi
    mov    alu,%eax
    mov    counter,%ecx
    sall   %cl,%eax                  # arithmetic left shift
    mov    %eax,alu
    jmp    print_after_op

do_sar:
    call   atoi
    mov    alu,%eax
    mov    counter,%ecx
    sarl   %cl,%eax                  # arithmetic right shift (sign-preserving)
    mov    %eax,alu
    jmp    print_after_op

do_and:
    call   atoi
    mov    counter,%eax
    andl   %eax,alu
    jmp    print_after_op

do_or:
    call   atoi_or                   # parse operand at offset 3
    mov    counter,%eax
    orl    %eax,alu
    jmp    print_after_op

do_xor:
    call   atoi
    mov    counter,%eax
    xorl   %eax,alu
    jmp    print_after_op

do_not:
    mov    alu,%eax
    notl   %eax
    mov    %eax,alu
    jmp    print_after_op

print_after_op:
    mov    alu,%eax
    mov    %eax,counter
    call   itoa
#   write decimal
    mov    $4,%eax
    mov    $1,%ebx
    mov    $itoa_string,%ecx
    mov    $11,%edx
    int    $0x80
    call   print_bin
    jmp    main

    mov    $1,%eax
    mov    $0,%ebx
    int    $0x80

atoi:
    # Check for 0b / 0B prefix at instruction+4
    movb   instruction+4,%al
    cmpb   $'0',%al
    jne    atoi_dec
    movb   instruction+5,%al
    cmpb   $'b',%al
    je     atoi_bin_start
    cmpb   $'B',%al
    je     atoi_bin_start
# fallthrough to decimal if no 0b
atoi_dec:
    mov    ilen,%esi			# set esi to the length of instruction variable
    dec    %esi				# point at the last byte (before \\n)
    mov    $1,%ebx			# scale factor 1,10,100,...
    movl   $0,counter    		# result
atoi_loop:
    mov    $0,%eax
    movb   instruction(%esi),%al	# eax = instruction[esi]
    subb   $'0',%al			# to binary 0..9
    imull  %ebx				# multiply by scale factor
    add    %eax,counter			# add to result
    imull   $10,%ebx,%ebx		# next decade
    dec    %esi				# move left
    cmpl   $4,%esi			# stop at index 4 (after "xxxx ")
    jge    atoi_loop
    ret

# binary parse branch for atoi()
atoi_bin_start:
    mov    $0,%eax                     # accumulator
    mov    $6,%esi                     # start at instruction + (4 + 2)
    mov    ilen,%edi                   # end index (exclusive)
atoi_bin_loop:
    cmp    %esi,%edi
    jge    atoi_bin_done
    movzbl instruction(,%esi,1),%edx
    cmp    $'0',%dl
    je     atoi_bin_zero
    cmp    $'1',%dl
    je     atoi_bin_one
    jmp    atoi_bin_done
atoi_bin_zero:
    shll   $1,%eax
    inc    %esi
    jmp    atoi_bin_loop
atoi_bin_one:
    shll   $1,%eax
    incl   %eax
    inc    %esi
    jmp    atoi_bin_loop
atoi_bin_done:
    mov    %eax,counter
    ret

atoi_or:
    # Check for 0b / 0B prefix at instruction+3
    movb   instruction+3,%al
    cmpb   $'0',%al
    jne    atoi_or_dec
    movb   instruction+4,%al
    cmpb   $'b',%al
    je     atoi_or_bin_start
    cmpb   $'B',%al
    je     atoi_or_bin_start
# decimal branch for "or " (offset 3)
atoi_or_dec:
    mov    ilen,%esi
    dec    %esi
    mov    $1,%ebx
    movl   $0,counter
atoi_or_loop:
    mov    $0,%eax
    movb   instruction(%esi),%al
    subb   $'0',%al
    imull  %ebx
    add    %eax,counter
    imull  $10,%ebx,%ebx
    dec    %esi
    cmpl   $3,%esi                     # stop at index 3 (after "or ")
    jge    atoi_or_loop
    ret

# binary branch for "or "
atoi_or_bin_start:
    mov    $0,%eax
    mov    $5,%esi                     # start at instruction + (3 + 2)
    mov    ilen,%edi
atoi_or_bin_loop:
    cmp    %esi,%edi
    jge    atoi_or_bin_done
    movzbl instruction(,%esi,1),%edx
    cmp    $'0',%dl
    je     atoi_or_bin_zero
    cmp    $'1',%dl
    je     atoi_or_bin_one
    jmp    atoi_or_bin_done
atoi_or_bin_zero:
    shll   $1,%eax
    inc    %esi
    jmp    atoi_or_bin_loop
atoi_or_bin_one:
    shll   $1,%eax
    incl   %eax
    inc    %esi
    jmp    atoi_or_bin_loop
atoi_or_bin_done:
    mov    %eax,counter
    ret

#   Function itoa() to convert integer variable counter's value to ASCII characters, placed in variable itoa_string.
itoa:
#   copy counter to %eax to prepare for division
    mov    counter,%eax
#   copy 10 spaces to itoa_string
    movl   $0x20202020,itoa_string
    movl   $0x20202020,itoa_string+4
    movw   $0x2020,itoa_string+8
#   point %edi index register to the last byte of itoa_string (index 9)
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
    addl   $'0',%edx
    movb   %dl,(%edi)
    dec    %edi
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

print_bin:
    push   %eax
    push   %ebx
    push   %ecx
    push   %edx
    push   %esi
    push   %edi

    push   $itob_string               # 2nd argument: char* buffer
    push   alu                        # 1st argument: int x (value at memory 'alu')
    call   itob
    addl   $8,%esp

    mov    $4,%eax                    # write(1, itob_string, 35)
    mov    $1,%ebx
    mov    $itob_string,%ecx
    mov    $35,%edx
    int    $0x80

    pop    %edi
    pop    %esi
    pop    %edx
    pop    %ecx
    pop    %ebx
    pop    %eax
    ret

