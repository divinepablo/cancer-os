.if .not .defined(ZEROPAGE_INCLUDED)
ZEROPAGE_INCLUDED = 1

.globalzp test_out, brk_reason, heap_ptr, heap_ptr2

.endif