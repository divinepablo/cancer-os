.if .not .defined(PRINT_INCLUDED)
PRINT_INCLUDED = 1
.global _c_print, _print, print_char
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
.endif