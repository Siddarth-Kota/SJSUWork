# A Hello World program in x86 32-bit assembly
#
# To compile this program into an executable helloworld.exe:
#
# gcc helloworld.s -o helloworld.exe
#
.global  main
.data
msg:
    .ascii "Hello, what is your name?\n"
msg_end:
name:
    .ascii "....................\n"
name_end:
greet:
    .ascii "Nice to meet you, "
greet_end:
.text
main:
#   calling write(1,msg,sizeof(msg))
    mov    $4,%eax      # eax=4 means indirectly call write()
    mov    $1,%ebx      # ebx=1 means write to channel 1 of Linux
    mov    $msg,%ecx    # ecx=msg means write the value of variable msg
    mov    $msg_end - msg,%edx     # edx=14 means write 14 bytes of msg
    int    $0x80        # interupt 0x80 invokes OS control function

#   calling read(0,name,5)
    mov    $3,%eax
    mov    $0,%ebx
    mov    $name,%ecx
    mov    $8,%edx
    int    $0x80

#   Adding a decimal after name
    decl   %eax
    movb   $'.',name(%eax)
    incl   %eax
    movb   $'\n',name(%eax)

#   calling write(1,greet,sizeof(greet))
    mov    $4,%eax      # eax=4 means indirectly call write()
    mov    $1,%ebx      # ebx=1 means write to channel 1 of Linux
    mov    $greet,%ecx    # ecx=msg means write the value of variable msg
    mov    $greet_end - greet,%edx     # edx=14 means write 14 bytes of msg
    int    $0x80        # interupt 0x80 invokes OS control function

#   calling write(1,name, sizeof(name))
    mov    $4,%eax
    mov    $1,%ebx
    mov    $name,%ecx
    mov    $8,%edx
    int    $0x80

#   calling exit(0)
    mov    $1,%eax
    mov    $0,%ebx
    int    $0x80