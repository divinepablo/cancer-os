.include "syscall.asm"
non_maskable_interrupt_handler:
    rti

hardware:
    bra interrupt_exit
software:
    phy
    inx ; get return address
    lda $100, x
    sta brk_reason
    inx
    lda $100, x
    sta brk_reason + 1
    dec brk_reason
    
@handle:
    sty $0
    lda (brk_reason), y
    sta $200
    ply
    jsr _syscall
    bra interrupt_exit
    
interrupt_handler: ; check if interrupt is from BRK instruction http://www.6502.org/tutorials/65c02opcodes.html#6
    phx
    tsx
    pha
    inx
    inx
    lda $100, x
    and #$10
    bne software
    beq hardware


interrupt_exit:
    pla
    plx
    rti

yelp: .asciiz "int"