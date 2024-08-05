TTY = $4000

.export _c_print
.code
.macro print str
    pha
    lda #<str
    sta TEST_OUT
    lda #>str
    sta TEST_OUT+1
    jsr _print
    pla
.endmacro

_c_print:
    sta TEST_OUT
    stx TEST_OUT+1
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
    lda (TEST_OUT), y
    bne _print_1
    ply
    rts



