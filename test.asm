.target "65C02"
.org $8000

.include "print.asm"
.include "interrupt.asm"

start:
    ldx #$ff
    txs
    cli

print(test)
syscall(1)

_loop:
    bra _loop



test: .asciiz "hi"

.org $fffa
.word non_maskable_interrupt_handler
.word start
.word interrupt_handler
