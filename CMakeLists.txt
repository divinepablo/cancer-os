cmake_minimum_required(VERSION 3.10.0)
project(cancerous VERSION 0.0.1 LANGUAGES C ASM)
set(CMAKE_TOOLCHAIN_FILE toolchain/cc65-toolchain.cmake)


set(assembly_files src/asm/zeropage.asm src/asm/allocator.asm src/asm/print.asm src/asm/interrupt.asm src/asm/numbertostring.asm src/asm/entry.asm src/asm/storage.asm)
set(c_files src/c/print.c src/c/test.c)
set(linker_cfg "${CMAKE_SOURCE_DIR}/src/linker.cfg") # this is because the make may or may not be ran from the root directory (thanks build.sh)

add_executable(cancerous ${assembly_files} ${c_files})

set_target_properties(cancerous PROPERTIES
    OUTPUT_NAME os.bin
    COMPILE_FLAGS "-t none --cpu 65C02"
    LINK_FLAGS "-t none -C ${linker_cfg} --cpu 65C02 -m os.map -Ln os.sym"
)