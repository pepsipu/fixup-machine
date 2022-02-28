CC ?= gcc
CFLAGS := -std=gnu11 -Wall -fcf-protection -Wl,-rpath=lib,--dynamic-linker=lib/ld-linux-x86-64.so.2 $(CFLAGS)

.PHONY: default
default: nightmare

nightmare: nightmare.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^