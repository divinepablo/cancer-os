.include "string.inc"
RESULT = $0300

number_to_string:
	pha 
	lsr
	lsr
	lsr
	lsr
    sta $310
	tax
	lda hexits,x
	sta tmp
	
	pla
	and #%00001111
	tax
	lda hexits,x
	tax
	ldy tmp
	rts

.rodata
hexits: .asciiz "0123456789abcdefg"

.data
tmp:    .byte 0