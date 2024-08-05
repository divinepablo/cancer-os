.setcpu "65C02"
.code

.include "zeropage.asm"
.include "print.asm"
.include "interrupt.asm"
.import _main
.export   __STARTUP__ : absolute = 1        ; Mark as startup

start:
    ldx #$ff
    txs
    cli


; _loop:
;     bra _loop

; call main from C
    jmp _main


test: .asciiz "hi"

.segment "VECTORS"
.word non_maskable_interrupt_handler
.word start
.word interrupt_handler
