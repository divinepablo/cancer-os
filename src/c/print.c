#include "print.h"
void print(const char* string) {
    while (*string != 0)
    {
        // Write to the screen
        *(unsigned char*)TTY = *string;
        string++;
    }
}