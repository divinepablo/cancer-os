#include "test.h"
#include "print.h"
struct _memory_page {
    char pad[256];
};

typedef struct _memory_page memory_page;
unsigned char buffer[3];
unsigned char init_pages()
{
    unsigned char _ = c_print("page\n");
    int page_iterator = PAGE_START;
    unsigned char pages = 0;
    
    buffer[2] = 0;
    for (; page_iterator < PAGE_END; page_iterator += PAGE_SIZE) 
    {
        memory_page *page = (memory_page *)page_iterator;
        unsigned char i = 0;
        page->pad[i] = 0xFF;
        
        c_print("Initialized page ");
        buffer[0] = HEX[pages >> 4];
        buffer[1] = HEX[pages & 0xF];
        c_print(buffer);
        c_print("\n");
        pages++;
    }
    return pages;
}