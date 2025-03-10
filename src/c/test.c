#include "test.h"
#include "print.h"
#include <string.h> // test

#define HEAP_START 0x2000
#define HEAP_SIZE 0x1000

struct heap_block {
    struct heap_block* next;
    unsigned int size;
    char used;
};

struct heap_info {
    struct heap_block* first;
};

struct heap_info* heap = (struct heap_info*)0x202;

#define DEBUG_ADDRESS 0x1000
#define DEBUG(type, value, offset) *(type*)(DEBUG_ADDRESS + offset) = value

void init_heap()
{
    c_print("init heap\n");
    heap->first = (struct heap_block*)HEAP_START;
    heap->first->next = 0;
    heap->first->size = HEAP_SIZE - sizeof(struct heap_block);
    heap->first->used = 0;
}

void* alloc(unsigned int size)
{
    struct heap_block* block = heap->first;
    struct heap_block* prev = 0;
    void* ptr = heap->first;

    DEBUG(int, (unsigned int)ptr, 0);
    DEBUG(int, block->size, 2);
    DEBUG(int, size, 4);

    return (void*)block;
}

void free(void* ptr)
{
    struct heap_block* block = (struct heap_block*)((char*)ptr - sizeof(struct heap_block));
    block->used = 0;

    while (block->next && !block->next->used)
    {
        block->size += block->next->size + sizeof(struct heap_block);
        block->next = block->next->next;
    }
}



// void main()
// {

// }