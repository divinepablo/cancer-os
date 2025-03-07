.import _main
.export   __STARTUP__ : absolute = 1        ; Mark as startup
.debuginfo
.include "print.inc"
.include "vectors.inc"
.include "zeropage.inc"
.include "alloc.inc"
.include "string.inc"
.include "storage.inc"

.code
start:
    ldx #$ff
    txs
    cli

    print test

    jsr init_heap

    ldy #$10
    jsr alloc

    lda #$ff
    jsr number_to_string

    tya
    jsr print_char
    txa
    jsr print_char

    ldx #0
    ldy #0
    lda #$ff
    jsr write_byte
    ; print RESULT
_loop:
    bra _loop

; call main from C
    ; jmp _main


test: .byte "init heap", $0a, $00

.segment "VECTORS"
.word non_maskable_interrupt_handler  ; NMI vector ($FFFA-$FFFB)
.word start                           ; RESET vector ($FFFC-$FFFD)
.word interrupt_handler               ; IRQ/BRK vector ($FFFE-$FFFF)
