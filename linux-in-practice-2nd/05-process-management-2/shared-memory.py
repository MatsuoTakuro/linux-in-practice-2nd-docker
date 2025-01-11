#!/usr/bin/python3

import os
import sys
import mmap
from sys import byteorder

PAGE_SIZE = 4096

data = 1000
print("子プロセス生成前のデータの値: {}".format(data))
# create a shared memory region
shared_memory = mmap.mmap(-1, PAGE_SIZE, flags=mmap.MAP_SHARED)

# write data to the head of the shared memory region
shared_memory[0:8] = data.to_bytes(8, byteorder)

pid = os.fork()
if pid < 0:
	print("fork()に失敗しました", file=os.stderr)
elif pid == 0:
	# read data from the head of the shared memory region
	data = int.from_bytes(shared_memory[0:8], byteorder)
	data *= 2
	# write the updated data to the head of the shared memory region
	shared_memory[0:8] = data.to_bytes(8, byteorder)
	sys.exit(0)

os.wait()
# read data from the head of the shared memory region
data = int.from_bytes(shared_memory[0:8], byteorder)
# prints 2000 because the parent and child processes share the same memory region
print("子プロセス終了後のデータの値: {}".format(data))
