.include "print.inc"
.include "zeropage.inc"
.import TTY
.export _c_print

_c_print:
    sta test_out
    stx test_out+1
    jsr _print

print_char: ; print content of A to screen
    sta TTY
    rts

_print:
    phy
    ldy #0
    beq @2
@1:
    jsr print_char
    iny
    
@2:
    lda (test_out), y
    bne @1
    ply
    rts
