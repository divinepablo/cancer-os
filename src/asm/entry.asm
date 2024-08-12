.setcpu "65C02"

.include "zeropage.asm"
.include "print.asm"
.include "interrupt.asm"
.include "allocator.asm"
.import _main
.export   __STARTUP__ : absolute = 1        ; Mark as startup
.debuginfo

.code
start:
    ldx #$ff
    txs
    cli

    print test

    jsr init_heap

    ldy #$10
    jsr alloc
_loop:
    bra _loop

; call main from C
    ; jmp _main


test: .byte "init heap", $0a, $00

.segment "VECTORS"
.word non_maskable_interrupt_handler
.word start
.word interrupt_handler
