// NO STDLIB

#define TTY 0x4000
#define HEX "0123456789ABCDEF"

unsigned char puts(const char* string);
char* byte_to_hex(char* buffer, unsigned char byte);
extern unsigned char c_print(const char* string);
// #define print(string) c_print(string)
// extern void c_print(const char* string);