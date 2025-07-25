#include "print.h"
unsigned char puts(const char* string) {
    unsigned char amount = 0;
    while (*string != 0)
    {
        // Write to the screen
        *(unsigned char*)TTY = *string;
        string++;
    }
    return amount;
}

char* byte_to_hex(char* buffer, unsigned char byte) {
    // char buffer[2];
    buffer[0] = "0123456789ABCDEF"[byte >> 4];
    buffer[1] = "0123456789ABCDEF"[byte & 0xF];
    return buffer;
}