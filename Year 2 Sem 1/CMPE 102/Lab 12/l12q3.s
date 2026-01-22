.globl main
.extern malloc
.extern strcpy
.extern memcpy
.data
sptr:           .long 0                    # struct student *
lastname:       .asciz "Kota"
idchars:        .ascii "017833894"
.text
main:
        pushl %ebp
        movl  %esp, %ebp

# sptr = malloc(sizeof(struct student))
        pushl $44
        call  malloc
        addl  $4, %esp
        movl  %eax, sptr

# place last name into (*sptr).student_name
        movl  sptr, %eax
        pushl $lastname
        pushl %eax
        call  strcpy
        addl  $8, %esp

#place integer into (*sptr).birthdate
        movl  sptr, %edi
        addl  $28, %edi
        movl  $20091125, (%edi)

#place ID into (*sptr).id
        movl  sptr, %edi
        addl  $32, %edi
        pushl $9
        pushl $idchars
        pushl %edi
        call  memcpy
        addl  $12, %esp

        leave
        ret
