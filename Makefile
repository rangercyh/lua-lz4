.PHONY: all clean

CFLAGS = -g3 -O2 -rdynamic -Wall -I.
SHARED = -fPIC --shared

all: lz4.so

lz4.so: lz4.c lz4hc.c lz4frame.c xxhash.c lua_lz4.c
	gcc $(CFLAGS) -std=c99 -Wno-unused-variable -DXXH_NAMESPACE=LZ4_ $(SHARED) $^ -o $@

test:
	lua test.lua

clean:
	rm -rf lz4.so
