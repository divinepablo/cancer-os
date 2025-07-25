# cancer-os

 A toy operating system for the 65c02

conglomerate of shitcode and copilot

## ideal memory map:

RAM: 0000-3FFF

TTY: 4000 <sub>(any ASCII character stored will be printed to console, used for input on keyboard interrupts)</sub>

STORAGE_POINTER_LOW: 7000

STORAGE_POINTER_HIGH: 7001

STORAGE_DATA: 7002

ROM: 8000-FFFF

