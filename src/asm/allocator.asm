.include "zeropage.inc"
.include "alloc.inc"
.import _init_pages
.import PAGES_START, PAGES_END, PAGE_SIZE

_PAGE_START = PAGES_START
_PAGE_END = PAGES_END
_PAGE_SIZE = PAGE_SIZE
.export _PAGE_START, _PAGE_END, _PAGE_SIZE

create_pages:
    jsr _init_pages



.data
page_count: .byte 0
