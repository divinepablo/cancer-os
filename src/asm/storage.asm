.include "storage.inc"

; Uses X, Y, A
; X -> File pointer low byte
; Y -> File pointer high byte
; A -> Byte to write
; Writes a byte to the storage RAM
write_byte:
    stx FP_REGISTERA
    sty FP_REGISTERA+1
    sta FP_REGISTERA+2
    rts