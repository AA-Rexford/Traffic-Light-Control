#!/bin/bash
nasm -f elf64 traffic.asm -o traffic.o
ld traffic.o -o traffic
echo "Build successful! Run with ./traffic"
