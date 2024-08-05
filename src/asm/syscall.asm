.macro syscall index
    ; use brk interrupt to call syscall
    brk
    .byte index
.endmacro

_syscall_1:
    rts

_syscall: ; A is syscall index
    cmp #1
    jsr _syscall_1
    rts