.global  main
.data
ticks: .long 0
command1: .ascii "date\0"
command2: .ascii "echo 'process LAM working ... '\0"
command3: .ascii "uptime\0"
command4: .ascii "echo \"process KOTA working ...\"\0"
cmd_list: .long command1,command2,command3,command4
n: .long 4
.text
main:
//  prologue
    push   %ebp
    mov    %esp,%ebp
//  call initialize_timer(4,timer_handler) to register timer interrupt per 4 seconds
    push   $timer_handler
    pushl  $4
    call   initialize_timer
    add    $8,%esp
//  After timer registration, run an infinite loop to process commands in cmd_list
loop:
//  compute edx = ticks % n to rotate among the n commands per time slice
    movl   ticks,%eax
    cdq
    idivl  n
    pushl   cmd_list(,%edx,4)
//  calling system(com_list[ticks%n])
    call   system
    addl   $4,%esp
//  calling sleep for 1 second after performing a command
    pushl   $1
    call   sleep
    addl   $4,%esp
//  infinite loop jump back
    jmp loop
    nop
    leave
    ret
timer_handler:
    push   %ebp
    mov    %esp,%ebp
    incl   ticks
    leave
    ret

