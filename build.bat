@REM yes this was coded on windows smd
@REM todo: convert to makefile
@echo off

@REM cl65 -C linker.cfg -O --cpu 65c02 -o out\os.bin src\c\test.c src\c\print.c src\asm\test.asm 
@REM check if build folder exists
IF NOT EXIST build (mkdir build)

cc65 -O --cpu 65c02 -o build\test.s src\c\test.c
cc65 -O --cpu 65c02 -o build\print.s src\c\print.c
ca65 -o build\test.o build\test.s
ca65 -o build\print.o build\print.s
ca65 -o build\entry.o src\asm\entry.asm
ld65 -o out\os.bin -C linker.cfg build\test.o build\entry.o build\print.o none.lib -Ln out\os.sym

@REM delete the build folder if flag is set
IF "%1"=="-d" (rmdir /s /q build)
