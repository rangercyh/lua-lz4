local lz4 = require("lz4")

-- simple frame
local s = "LZ4 is a very fast compression and decompression algorithm."
print('simple frame')
print("s = ", s)
local c = lz4.compress(s)
print("lz4.compress = ", c)
local d = lz4.decompress(c)
print("lz4.decompress = ", d)
assert(d == s)

-- block
print('block')
print("s = ", s)
local bc = lz4.block_compress(s)
print("lz4.block_compress = ", bc)
local bds = lz4.block_decompress_safe(bc, #s)
print("lz4.block_decompress_safe = ", bds)
assert(bds == s)

-- stream
print('stream')
local s1 = "LZ4 is a very fast compression and decompression algorithm."
local s2 = "lua-lz4 - LZ4 binding for Lua"
print("s1 = ", s1)
print("s2 = ", s2)
local com = lz4.new_compression_stream()
local dec = lz4.new_decompression_stream()
local cs1 = com:compress(s1)
print("lz4.new_compression_stream():compress(s1) = ", cs1)
local dcs1 = dec:decompress_safe(cs1, #s1)
print("lz4.new_decompression_stream():decompress_safe(s1) = ", dcs1)
assert(dcs1 == s1)

local cs2 = com:compress(s2)
print("lz4.new_compression_stream():compress(s2) = ", cs2)
local dcs2 = dec:decompress_safe(cs2, #s2)
print("lz4.new_decompression_stream():decompress_safe(s2) = ", dcs2)
assert(dcs2 == s2)
