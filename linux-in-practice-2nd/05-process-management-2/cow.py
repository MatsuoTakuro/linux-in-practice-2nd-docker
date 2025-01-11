#!/usr/bin/python3

import os
import subprocess
import sys
import mmap
import datetime
import time
import random

# Constants
ALLOC_SIZE = 100 * 1024 * 1024  # Allocate 100 MiB of memory
PAGE_SIZE = 4096  # Memory page size, typically 4 KiB

# Function to access all pages of a memory region
def access(data):
    # Write a random value to each page of the allocated memory region to ensure CoW is triggered
    for i in range(0, ALLOC_SIZE, PAGE_SIZE):
        data[i] = random.randint(0, 255)  # Assign random values to ensure CoW happens

# Function to display memory information
def show_meminfo(msg, process):
    print("{}: {}".format(datetime.datetime.now().strftime("%H:%M:%S"), msg))
    # Display overall system memory usage
    subprocess.run("free")
    # Display memory usage details of the current process: RSS, major and minor page faults
    print("{}のメモリ関連情報".format(process))
    subprocess.run(["ps", "-orss,maj_flt,min_flt", str(os.getpid())])
    print()
    time.sleep(2)

# Allocate 100 MiB of memory using mmap
# mmap allows memory mapping, and we use MAP_PRIVATE for a private copy-on-write mapping
data = mmap.mmap(-1, ALLOC_SIZE, flags=mmap.MAP_PRIVATE)

# Access the memory to trigger page mappings for all allocated pages
access(data)

# Display memory information for the parent process before forking
show_meminfo("*** 子プロセス生成前 ***", "親プロセス")

# Fork a new process
pid = os.fork()

# Handle the result of the fork call
if pid < 0:
    # Fork failed
    print("fork()に失敗しました", file=sys.stderr)
elif pid == 0:
    # Child process
    # Display memory information immediately after fork
    show_meminfo("*** 子プロセス生成直後 ***", "子プロセス")
    # Access the memory to trigger copy-on-write behavior (writes to private pages)
    access(data)
    # Display memory information after accessing and modifying memory
    show_meminfo("*** 子プロセスによるメモリアクセス後 ***", "子プロセス")
    # Exit the child process
    sys.exit(0)

# Parent process waits for the child process to finish
os.wait()
