.if .not .defined(STORAGE_INCLUDED)
STORAGE_INCLUDED = 1
.import STORAGE_BASE
.global write_byte, read_byte, set_file_pointer
FP_REGISTERA = STORAGE_BASE
FP_REGISTERB = STORAGE_BASE + 1
STORAGE_IO_PORT = STORAGE_BASE + 2
.endif