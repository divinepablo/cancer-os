.target "65C02"

.macro syscall(index)
    ; use brk interrupt to call syscall
    brk
    .byte index
.endmacro


_syscall: ; A is syscall index
    cmp #1
    beq _syscall_1
    rts