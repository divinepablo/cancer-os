

.if .not .defined(VECTORS_INCLUDED)
VECTORS_INCLUDED = 1
.global non_maskable_interrupt_handler, start, interrupt_handler
.endif