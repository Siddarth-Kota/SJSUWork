.global  main
.data
student_id: .long 0
.text
main:
        movl    $17833894,student_id
        movl    student_id, %eax
        movl    %eax, %ebx
        mull    %ebx

part1_done:
        movl    student_id, %eax
        negl    %eax
        movl    %eax, %ebx
        movl    student_id, %eax
        imull   %ebx

        movl    student_id, %eax
        negl    %eax
        cdq
        movl    $11, %ecx
        idivl   %ecx
after_div:
#exit
        mov     $0, %eax
        mov     $0, %ebx
        int     $0x80