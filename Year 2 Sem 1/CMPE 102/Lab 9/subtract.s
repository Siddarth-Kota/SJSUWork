.text
.global subtract
subtract:
    pushl  %ebp
    movl   %esp, %ebp
    movl   8(%ebp), %eax     # eax = a
    subl   12(%ebp), %eax    # eax = a - b
    leave
    ret
