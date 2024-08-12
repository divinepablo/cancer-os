TTY = $4000

.export _c_print
.code
.macro print str
    pha
    lda #<str
    sta test_out
    lda #>str
    sta test_out+1
    jsr _print
    pla
.endmacro

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
    beq _print_2
_print_1:
    jsr print_char
    iny
    
_print_2:
    lda (test_out), y
    bne _print_1
    ply
    rts



