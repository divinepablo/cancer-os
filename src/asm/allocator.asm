.include "zeropage.inc"
.include "alloc.inc"

.struct HeapBlock
    size .word
    next .word
    used .byte
.endstruct

.struct HeapInfo 
    head .word
.endstruct

init_heap:
    lda #$95
    sta heap_size
    lda #$09
    sta heap_size+1
    

    lda #00
    ldx #$20 ; start of heap
    sta heap_info+HeapInfo::head
    stx heap_info+HeapInfo::head+1
    sta heap_ptr
    stx heap_ptr+1

    lda #0
    ldy #HeapBlock::next
    sta (heap_ptr), y
    ldy #HeapBlock::next+1
    sta (heap_ptr), y
    ldy #HeapBlock::used
    sta (heap_ptr), y



    lda heap_size
    ldy #HeapBlock::size
    sta (heap_ptr), y
    lda heap_size+1
    ldy #HeapBlock::size+1
    sta (heap_ptr), y
    rts

alloc: ; destroys A, X, Y
    sty allocate_amount ; allows us to mutate y while keeping the original value
    lda heap_info+HeapInfo::head
    ldx heap_info+HeapInfo::head+1
    sta heap_ptr
    stx heap_ptr+1
; @loop:
;     ; check if heap ptr is null
;     ldy #HeapBlock::size
;     lda (heap_ptr), y
;     sta block_size
;     ldy #HeapBlock::size+1
;     lda (heap_ptr), y
;     sta block_size+1
;     ; cmp block_size ; removed loop logic, (hopefully) unnecessary
;     ; bcc @loop_end
;     ; beq @loop_end
;     ; bra @loop
@loop_end:
    lda #0
    ldy #0
    cmp (heap_ptr), y
    beq @end
    
    ldy #HeapBlock::used
    lda #1
    sta (heap_ptr), y

    ldy #HeapBlock::next
    lda #0
    sta (heap_ptr), y
    
    ; set size of block and make new block with remaining part of heap
    ldy #HeapBlock::size
    lda (heap_ptr), y
    sbc allocate_amount
    sta block_size
    ldy #HeapBlock::size+1
    lda (heap_ptr), y
    sbc #0
    sta block_size

    lda allocate_amount
    ldy #HeapBlock::size
    sta (heap_ptr), y
    lda #00 ; clear high byte, can only allocate 255 bytes at a time
    ldy #HeapBlock::size+1
    sta (heap_ptr), y

    ldy #0
    lda heap_ptr
    sta return_value
    lda heap_ptr+1
    sta return_value+1

    

@end:
    rts


    
    
.data
    heap_info: .tag HeapInfo
    heap_size: .word 0 ; 1000 - sizeof(HeapBlock) (5)
    allocate_amount: .byte 0
    block_size: .word 0
    return_value: .word 0

    

