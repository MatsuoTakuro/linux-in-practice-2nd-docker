$ sudo apt install binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao
 fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system

sudo apt install -y binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system


$ sudo adduser `id -un` libvirt
$ sudo adduser `id -un` libvirt-qemu
$ sudo adduser `id -un` kvm

ctl c copy
ctl v paste

1234567890-=[];’\,./
!@#$%^&*()_+{}:”|<>?

https://github.com/satoru-takeuchi/linux-in-practice-2nd/

https://go.dev/doc/install

https://starship.rs/

sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

✦ ❯ readelf -h pause
ELF Header:
…
  Entry point address:           	0x401050
…

✦ ❯ readelf -S pause
There are 31 section headers, starting at offset 0x3938:

Section Headers:
  [Nr] Name          	Type         	Address       	Offset
   	Size          	EntSize      	Flags  Link  Info  Align
…
  [15] .text         	PROGBITS     	0000000000401050  00001050
   	0000000000000175  0000000000000000  AX   	0 	0 	16
…
  [25] .data         	PROGBITS     	0000000000404020  00003020
   	0000000000000010  0000000000000000  WA   	0 	0 	8
…

✦ ❯ cat /proc/11169/maps
00400000-00401000 r--p 00000000 08:05 1227095                        	/home/taro/linux-in-practice-2nd/02-process-management-1/pause
00401000-00402000 r-xp 00001000 08:05 1227095                        	/home/taro/linux-in-practice-2nd/02-process-management-1/pause
00402000-00403000 r--p 00002000 08:05 1227095                        	/home/taro/linux-in-practice-2nd/02-process-management-1/pause
00403000-00404000 r--p 00002000 08:05 1227095                        	/home/taro/linux-in-practice-2nd/02-process-management-1/pause
00404000-00405000 rw-p 00003000 08:05 1227095                        	/home/taro/linux-in-practice-2nd/02-process-management-1/pause
7f483cbb0000-7f483cbd2000 r--p 00000000 08:05 526547                 	/usr/lib/x86_64-linux-gnu/libc-2.31.so
7f483cbd2000-7f483cd4a000 r-xp 00022000 08:05 526547                 	/usr/lib/x86_64-linux-gnu/libc-2.31.so
7f483cd4a000-7f483cd98000 r--p 0019a000 08:05 526547                 	/usr/lib/x86_64-linux-gnu/libc-2.31.so
7f483cd98000-7f483cd9c000 r--p 001e7000 08:05 526547                 	/usr/lib/x86_64-linux-gnu/libc-2.31.so
7f483cd9c000-7f483cd9e000 rw-p 001eb000 08:05 526547                 	/usr/lib/x86_64-linux-gnu/libc-2.31.so
7f483cd9e000-7f483cda4000 rw-p 00000000 00:00 0
7f483cdb6000-7f483cdb7000 r--p 00000000 08:05 526521                 	/usr/lib/x86_64-linux-gnu/ld-2.31.so
7f483cdb7000-7f483cdda000 r-xp 00001000 08:05 526521                 	/usr/lib/x86_64-linux-gnu/ld-2.31.so
7f483cdda000-7f483cde2000 r--p 00024000 08:05 526521                 	/usr/lib/x86_64-linux-gnu/ld-2.31.so
7f483cde3000-7f483cde4000 r--p 0002c000 08:05 526521                 	/usr/lib/x86_64-linux-gnu/ld-2.31.so
7f483cde4000-7f483cde5000 rw-p 0002d000 08:05 526521                 	/usr/lib/x86_64-linux-gnu/ld-2.31.so
7f483cde5000-7f483cde6000 rw-p 00000000 00:00 0
7ffc5692c000-7ffc5694e000 rw-p 00000000 00:00 0                      	[stack]
7ffc569f9000-7ffc569fd000 r--p 00000000 00:00 0                      	[vvar]
7ffc569fd000-7ffc569ff000 r-xp 00000000 00:00 0                      	[vdso]
ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0              	[vsyscall]

‘false’ command is used to return an exit status code (“1” by default) that indicates failure.

1. $!
Meaning: The process ID (PID) of the most recently started background process.
- When you start a background job (using &), $! holds the PID of that process.

2. $?
Meaning: The exit status of the most recently executed command.
- A command that runs successfully returns 0.
- A command that fails returns a non-zero value.

# on ubuntu
ps ajx | grep -E 'bash|ps ajx|COMMAND'
PPID     PID    PGID     SID TTY        TPGID STAT   UID   TIME COMMAND
3277    4052    4052    4052 pts/5      58608 Ss    1000   0:00 /usr/bin/bash --init-file /snap/code/177/usr/share/code/resources/app/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-bash.sh
4052   58608   58608    4052 pts/5      58608 R+    1000   0:00 ps ajx
4052   58609   58608    4052 pts/5      58608 S+    1000   0:00 grep --color=auto -E bash|ps ajx|COMMAND

# on mac
❯ ps ajx | grep -E 'zsh|ps ajx|COMMAND'
USER               PID  PPID  PGID   SESS JOBC STAT   TT       TIME COMMAND
takuro           54870 54869 54870      0    0 Ss   s001    0:00.39 /bin/zsh -il
root             76800 54870 76800      0    2 R+   s001    0:00.01 ps ajx
takuro           76801 54870 76800      0    2 S+   s001    0:00.00 grep -E zsh|ps ajx|COMMAND

❯ ./cpuperf.sh 8
[2024-12-21 16:15:57] Measurement 1 started.
[2024-12-21 16:16:03] Measurement 1 completed. Elapsed time: 6.433420960s
[2024-12-21 16:16:03] Measurement 2 started.
[2024-12-21 16:16:15] Measurement 2 completed. Elapsed time: 11.714419101s
[2024-12-21 16:16:15] Measurement 3 started.
[2024-12-21 16:16:30] Measurement 3 completed. Elapsed time: 14.479307561s
[2024-12-21 16:16:30] Measurement 4 started.
[2024-12-21 16:16:50] Measurement 4 completed. Elapsed time: 20.770413339s
[2024-12-21 16:16:50] Measurement 5 started.
[2024-12-21 16:17:16] Measurement 5 completed. Elapsed time: 25.863297943s
[2024-12-21 16:17:16] Measurement 6 started.
[2024-12-21 16:17:44] Measurement 6 completed. Elapsed time: 28.030701696s
[2024-12-21 16:17:44] Measurement 7 started.
[2024-12-21 16:18:11] Measurement 7 completed. Elapsed time: 26.550802496s
[2024-12-21 16:18:11] Measurement 8 started.
[2024-12-21 16:18:43] Measurement 8 completed. Elapsed time: 32.312162852s
./cpuperf.sh: line 77: unexpected EOF while looking for matching `"'
./cpuperf.sh: line 80: syntax error: unexpected end of file

❯ lscpu
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
Byte Order:                           Little Endian
Address sizes:                        39 bits physical, 48 bits virtual
CPU(s):                               2
On-line CPU(s) list:                  0,1
Thread(s) per core:                   1
Core(s) per socket:                   2
Socket(s):                            1
NUMA node(s):                         1
Vendor ID:                            GenuineIntel
CPU family:                           6
Model:                                78
Model name:                           Intel(R) Core(TM) i5-6267U CPU @ 2.90GHz
Stepping:                             3
CPU MHz:                              2906.900
BogoMIPS:                             5813.80
Hypervisor vendor:                    KVM
Virtualization type:                  full
L1d cache:                            64 KiB
L1i cache:                            64 KiB
L2 cache:                             512 KiB
L3 cache:                             8 MiB
NUMA node0 CPU(s):                    0,1
Vulnerability Gather data sampling:   Unknown: Dependent on hypervisor status
Vulnerability Itlb multihit:          KVM: Mitigation: VMX unsupported
Vulnerability L1tf:                   Mitigation; PTE Inversion
Vulnerability Mds:                    Mitigation; Clear CPU buffers; SMT Host state unknown
Vulnerability Meltdown:               Mitigation; PTI
Vulnerability Mmio stale data:        Mitigation; Clear CPU buffers; SMT Host state unknown
Vulnerability Reg file data sampling: Not affected
Vulnerability Retbleed:               Vulnerable
Vulnerability Spec rstack overflow:   Not affected
Vulnerability Spec store bypass:      Vulnerable
Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Retpoline
Vulnerability Srbds:                  Unknown: Dependent on hypervisor status
Vulnerability Tsx async abort:        Not affected
Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall
                                       nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma 
                                      cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch i
                                      nvpcid_single pti fsgsbase bmi1 avx2 bmi2 invpcid rdseed adx clflushopt arat md_clear flush_l1d arch_capabil
                                      ities

❯ free
              total        used        free      shared  buff/cache   available
Mem:        2010468     1127044       88116       19220      795308      705604
Swap:       1190340      429828      760512


❯ sudo ./buff-cache-100m-edited.sh
ファイル作成前のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010464     1313588      419948       19868      276928      527136
Swap:       1190340      367356      822984
100MBのファイルを新規作成します。これによってカーネルはメモリ上に100MBのページキャッシュ領域を獲得します。
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.99225 s, 106 MB/s
ページキャッシュ獲得後のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010464     1212240      519676       19868      278548      628616
Swap:       1190340      367356      822984
ファイル削除後、つまりページキャッシュ削除後のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010464     1264352      469528       19868      276584      576380
Swap:       1190340      367356      822984

❯ sudo ./buff-cache-100m-edited.sh 
ファイル作成前のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010468     1417528      262860       22412      330080      421500
Swap:       1190340      170540     1019800
100MBのファイルを新規作成します。これによってカーネルはメモリ上に100MBのページキャッシュ領域を獲得します。
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.787129 s, 133 MB/s
ページキャッシュ獲得後のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010468     1409772      269924       22412      330772      429264
Swap:       1190340      170540     1019800
ファイル削除後、つまりページキャッシュ削除後のシステム全体のメモリ使用量を表示します。
              total        used        free      shared  buff/cache   available
Mem:        2010468     1390308      287812       22412      332348      448684
Swap:       1190340      170540     1019800


// *** 新規メモリ領域獲得前のメモリマップ ***
// - Shows existing memory layout, including code, data, heap, and stack.
// - Executable code, read-only data, and writable data are mapped at lower addresses.
// - Heap is used for dynamic allocations.
// - Large reserved memory areas and stack memory are visible.
// - Kernel-specific mappings (vvar, vdso, vsyscall) support fast system calls and timekeeping.
00400000-004aa000 r-xp 00000000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap // Executable code
004aa000-00583000 r--p 000aa000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap // Read-only data
00583000-0059a000 rw-p 00183000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap // Writable data
0059a000-005b8000 rw-p 00000000 00:00 0                                                                                                   // Heap
c000000000-c004000000 rw-p 00000000 00:00 0                                                                                               // Reserved memory
7fe3b4380000-7fe3b6631000 rw-p 00000000 00:00 0                                                                                           // Reserved memory
7ffc1520e000-7ffc15230000 rw-p 00000000 00:00 0                          [stack]                                                          // Stack
7ffc15302000-7ffc15306000 r--p 00000000 00:00 0                          [vvar]                                                           // Kernel-specific mapping
7ffc15306000-7ffc15308000 r-xp 00000000 00:00 0                          [vdso]                                                           // Kernel-specific mapping
ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0                  [vsyscall]                                                       // Kernel-specific mapping

// *** 新規メモリ領域: アドレス = 0x7fe374380000, サイズ = 0x40000000 ***
// - Allocated 1GB of anonymous memory at address 0x7fe374380000.
// - Memory is writable and private, not shared with other processes.
// - The start address 0x7fe374380000 matches this allocation because mmap dynamically maps memory starting at the requested address or the next available region.

// *** 新規メモリ領域獲得後のメモリマップ ***
// - Displays the updated memory map after allocation.
// - New region appears at a high virtual address, dynamically extending memory.
// - Other regions remain unchanged, preserving their original layout.
// - The allocated memory can now be used for data storage or processing tasks.
00400000-004aa000 r-xp 00000000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap
004aa000-00583000 r--p 000aa000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap
00583000-0059a000 rw-p 00183000 00:33 230                                /media/sf_shared/linux-in-practice-2nd/04-memory-management/mmap
0059a000-005b8000 rw-p 00000000 00:00 0
c000000000-c004000000 rw-p 00000000 00:00 0
7fe374380000-7fe3b6631000 rw-p 00000000 00:00 0                          // Allocated memory: Starts at 0x7fe374380000 and spans to 0x7fe3b6631000.
// - The range size is 0x40000000 bytes, equivalent to 1GB.
// - The size can be confirmed by calculating: 0x7fe3b6631000 - 0x7fe374380000 = 0x40000000.
// - Permissions are 'rw-p', meaning read/write and private (not shared).
// - The starting address matches the allocated region because mmap either uses the requested address or finds the next available space.
7ffc1520e000-7ffc15230000 rw-p 00000000 00:00 0                          [stack]
7ffc15302000-7ffc15306000 r--p 00000000 00:00 0                          [vvar]
7ffc15306000-7ffc15308000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0                  [vsyscall]

❯ ./demand-paging.py 
13:31:45: 新規メモリ領域獲得前。Enterキーを押すと100MiBの新規メモリ領域を獲得します: 
# Memory allocation requested but not accessed yet.
# kbmemused: 1272132 (~1.27GB), %memused: 63.28%
# Memory usage is stable since allocation is virtual, not physical.

13:31:46: 新規メモリ領域を獲得しました。Enterキーを押すと1秒に10MiBづつ、合計100MiBの新規メモリ領域にアクセスします: 
# Memory allocated but no significant change in usage.
# kbmemused: 1271372 (~1.27GB), %memused: 63.24%
# Physical memory is not committed until accessed due to demand paging.

13:31:48: 10 MiBアクセスしました
13:31:49: 20 MiBアクセスしました
13:31:50: 30 MiBアクセスしました
13:31:51: 40 MiBアクセスしました
13:31:52: 50 MiBアクセスしました
13:31:53: 60 MiBアクセスしました
13:31:54: 70 MiBアクセスしました
13:31:55: 80 MiBアクセスしました
13:31:56: 90 MiBアクセスしました
# Memory usage increases incrementally by ~10MiB per step as pages are accessed.
# kbmemused grows from 1272132 → 1340268 (~66.66%).
# Physical pages are dynamically allocated, reflecting demand paging behavior.

13:31:57: 新規獲得したメモリ領域のすべてのアクセスしました。Enterキーを押すと終了します: 
# All allocated memory has been accessed.
# kbmemused peaked at 1340268 (~66.66%), confirming 100MiB was physically committed.


❯ sar -r 1
Linux 5.15.0-127-generic (howlinuxworks)        01/04/2025      _x86_64_        (4 CPU)

01:31:40 PM kbmemfree   kbavail kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty
01:31:41 PM    139140    492964   1261976     62.77     10880    466552   9767908    305.17    319544   1329020       516
01:31:42 PM    130068    483892   1271040     63.22     10880    466568   9094288    284.12    319568   1338528       516
01:31:43 PM    129816    483712   1271220     63.23     10904    466616   9093204    284.09    319628   1324640       524
01:31:44 PM    125284    479180   1271932     63.27     10904    470440   9098356    284.25    319640   1336060       524
# Memory allocated but not accessed yet. No significant change in physical memory usage.
01:31:45 PM    125032    478928   1272132     63.28     10904    470440   9097224    284.22    319640   1335696       524
# Memory allocated, but physical pages are still not committed. Demand paging in effect.
01:31:46 PM    125792    479688   1271372     63.24     10904    470440   9101584    284.35    319692   1331512       524
01:31:47 PM    123024    476920   1274120     63.37     10904    470440   9205836    287.61    319704   1333884       524
# First 10 MiB accessed. Physical memory usage starts increasing incrementally.
01:31:48 PM    126048    479944   1271104     63.22     10904    470440   9195584    287.29    319704   1320684       524
01:31:49 PM    125040    478936   1272112     63.27     10912    470432   9195584    287.29    319704   1332388       524
01:31:50 PM    114964    468868   1282192     63.78     10912    470440   9195584    287.29    319712   1343536       524
01:31:51 PM    103628    457532   1293496     64.34     10912    470440   9195584    287.29    319712   1354992       524
01:31:52 PM     92540    446444   1304588     64.89     10912    470440   9191544    287.16    319700   1362420       524
01:31:53 PM     84980    438884   1312148     65.27     10912    470440   9191592    287.16    319700   1373700       524
01:31:54 PM     72632    426536   1324512     65.88     10912    470440   9192740    287.20    319712   1384980       524
01:31:55 PM     69400    419220   1331844     66.25     10900    466368   9191544    287.16    314428   1388812       524
# 90 MiB accessed. Almost complete allocation with most pages committed.
01:31:56 PM     66124    415944   1335128     66.41     10900    466368   9193748    287.23    314448   1401304       272
# Full 100 MiB accessed. Memory usage peaks at 66.66%, reflecting full commitment.
01:31:57 PM     83928    410816   1340268     66.66     10728    443612   9192616    287.20    311288   1392368       272
01:31:58 PM     72336    399224   1351860     67.24     10728    443612   9192616    287.20    311288   1404156       272
# Process ends, and memory usage drops back to near the initial state as pages are released.
01:31:59 PM    176536    483080   1267996     63.07     10224    423764   9100536    284.32    303104   1302880       272
01:32:00 PM    174580    481152   1271080     63.22     10224    422676   9099496    284.29    303156   1303160       280
01:32:01 PM    173580    480152   1271000     63.22     10224    423808   9101872    284.36    303160   1306780       136
^C

Average:       115927    460096   1291577     64.24     10790    460227   9185192    286.96    316011   1347690       445


❯ ./demand-paging.py 
11:46:40: Before acquiring new memory region. Press Enter to acquire 100MiB of new memory region: 

11:46:42: Acquired new memory region. Press Enter to access 10MiB of new memory region every second, totaling 100MiB: 

11:46:44: Actually 10 MiB accessed
11:46:45: Actually 20 MiB accessed
11:46:46: Actually 30 MiB accessed
11:46:47: Actually 40 MiB accessed
11:46:48: Actually 50 MiB accessed
11:46:49: Actually 60 MiB accessed
11:46:50: Actually 70 MiB accessed
11:46:51: Actually 80 MiB accessed
11:46:52: Actually 90 MiB accessed
11:46:53: All of the newly acquired memory region has been accessed. Press Enter to exit: 

❯ sar -B 1
Linux 5.15.0-127-generic (howlinuxworks)        01/05/2025      _x86_64_        (4 CPU)

11:46:36 AM  pgpgin/s pgpgout/s   fault/s  majflt/s  pgfree/s pgscank/s pgscand/s pgsteal/s    %vmeff
11:46:37 AM    258.82    121.57   1367.65      0.00    689.22      0.00      0.00      0.00      0.00  # Before memory allocation - low faults.
11:46:38 AM    674.00      0.00   5735.00      2.00   4469.00      0.00      0.00      0.00      0.00  # Allocating 100 MiB - sharp increase in faults.
11:46:39 AM      0.00    192.00   3686.00      0.00   2640.00      0.00      0.00      0.00      0.00  # Allocated memory stabilizing - fewer faults.
11:46:40 AM    516.00     52.00   3577.00      0.00   1620.00      0.00      0.00      0.00      0.00  # Preparing for memory access phase.
11:46:41 AM      0.00      0.00   2143.00      0.00   1540.00      0.00      0.00      0.00      0.00  # Minor faults as memory region initializes.
# Acquired memory region but not accessed yet. No significant change in faults.
11:46:42 AM      0.00      0.00   1050.50      0.00   3270.30      0.00      0.00      0.00      0.00  # Initial access (10 MiB) - low activity.
11:46:43 AM      0.00      0.00   1883.17      0.00   1736.63      0.00      0.00      0.00      0.00  # Accessing 10–20 MiB - faults rise gradually.
# Starting memory access phase with 10 MiB accessed. Faults increase as more pages are loaded.
11:46:44 AM      0.00      0.00   5398.00      0.00   1950.00      0.00      0.00      0.00      0.00  # Accessing 20–30 MiB - sharp fault increase.
11:46:45 AM      0.00    419.80   3769.31      0.00   1184.16    435.64      0.00    617.82    141.82  # Accessing 30–40 MiB - swap activity starts (%vmeff > 100).
11:46:46 AM      0.00      0.00   4580.20      0.00   2810.89      0.00      0.00      0.00      0.00  # Accessing 40–50 MiB - high faults as more pages are loaded.
11:46:47 AM      0.00  12760.40   3345.54      0.00   7876.24  12833.66      0.00  14225.74    110.85  # Accessing 50–60 MiB - heavy swap-out and page scan.
11:46:48 AM      0.00      0.00   6173.00      0.00    223.00      0.00      0.00      0.00      0.00  # Accessing 60–70 MiB - faults peak during memory pressure.
11:46:49 AM      0.00     88.00   4737.00      0.00   3823.00   2824.00      0.00   4624.00    163.74  # Accessing 70–80 MiB - swap and reclaim activity continues.
11:46:50 AM      0.00   2924.00   3864.00      0.00   2579.00   2996.00      0.00   3532.00    117.89  # Accessing 80–90 MiB - faults gradually reduce.
11:46:51 AM      4.00   1396.00   5158.00      1.00   5403.00   2781.00      0.00   3666.00    131.82  # Accessing 90–100 MiB - nearing completion with cleanup.
11:46:52 AM      0.00      0.00   3506.00      0.00   3547.00      0.00      0.00      0.00      0.00  # Final memory access - faults stabilizing.
# All memory accessed. Faults reduce as pages are released and cache settles.
11:46:53 AM      0.00   4984.00   2745.00      0.00   4354.00   6151.00      0.00   7446.00    121.05  # Memory access complete - cleanup continues.
11:46:54 AM    645.54      0.00   4637.62      0.00  28888.12      0.00      0.00      0.00      0.00  # Post-access phase - minor faults as cache settles.
11:46:55 AM      0.00    216.00   6549.00      0.00   2120.00      0.00      0.00      0.00      0.00  # Cleanup and page release activity.
11:46:56 AM      0.00      0.00   2648.00      0.00   1715.00      0.00      0.00      0.00      0.00  # Stabilization with reduced page faults.
11:46:57 AM      0.00    108.00   1330.00      0.00   2995.00      0.00      0.00      0.00      0.00  # Near idle state - final cleanup.
11:46:58 AM      4.00      0.00    581.00      1.00   3250.00      0.00      0.00      0.00      0.00  # Fully stabilized, low activity.


❯ ./demand-paging.py 
10:29:57: Before acquiring new memory region. Press Enter to acquire 100MiB of new memory region: 

10:30:02: Acquired new memory region. Press Enter to access 10MiB of new memory region every second, totaling 100MiB: 

10:30:03: Actually 10 MiB accessed
10:30:04: Actually 20 MiB accessed
10:30:05: Actually 30 MiB accessed
10:30:07: Actually 40 MiB accessed
10:30:08: Actually 50 MiB accessed
10:30:09: Actually 60 MiB accessed
10:30:10: Actually 70 MiB accessed
10:30:11: Actually 80 MiB accessed
10:30:12: Actually 90 MiB accessed
10:30:13: All of the newly acquired memory region has been accessed. Press Enter to exit: 

❯ ./capture.sh
# time                            vsz    rss  maj_flt min_flt
Sun 05 Jan 2025 10:30:00 AM JST:  13360  9184      2   1334  # Initial state: Memory usage before acquiring a new memory region. VSZ (virtual memory) is minimal, and RSS (physical memory) reflects only the process's code and data.
Sun 05 Jan 2025 10:30:01 AM JST:  13360  9184      2   1334  # Before memory allocation: No change in memory usage, as no new region has been allocated yet.
Sun 05 Jan 2025 10:30:02 AM JST: 115760  9184      2   1334  # After acquiring 100MiB virtual memory: VSZ increases sharply, but RSS remains the same because physical memory is not allocated yet (lazy allocation).
Sun 05 Jan 2025 10:30:03 AM JST: 115760  9184      2   1334  # Still no physical memory allocated. The process is waiting for access to start.
Sun 05 Jan 2025 10:30:04 AM JST: 115760 19480      2   3895  # 10MiB accessed: RSS increases, indicating physical memory allocation. Minor faults (min_flt) rise due to page table updates without disk I/O.
Sun 05 Jan 2025 10:30:05 AM JST: 115760 29776      2   6455  # 20MiB accessed: RSS continues to increase. Minor faults rise further as more memory pages are committed to physical memory.
Sun 05 Jan 2025 10:30:06 AM JST: 115760 40072      2   9015  # 30MiB accessed: Incremental memory allocation continues with rising RSS and minor faults.
Sun 05 Jan 2025 10:30:07 AM JST: 115760 50104      2  11575  # 40MiB accessed: More physical pages are committed. Incremental allocation through demand paging is evident.
Sun 05 Jan 2025 10:30:08 AM JST: 115760 60400      2  14135  # 50MiB accessed: Halfway through the allocation. RSS matches the accessed size, showing physical commitment.
Sun 05 Jan 2025 10:30:09 AM JST: 115760 70696      2  16695  # 60MiB accessed: RSS and minor faults keep increasing as more memory is accessed.
Sun 05 Jan 2025 10:30:10 AM JST: 115760 80992      2  19255  # 70MiB accessed: The pattern of gradual physical memory commitment continues.
Sun 05 Jan 2025 10:30:11 AM JST: 115760 91288      2  21815  # 80MiB accessed: Most of the allocated memory is now committed to physical memory.
Sun 05 Jan 2025 10:30:12 AM JST: 115760 101320     2  24375  # 90MiB accessed: Almost complete. Memory pages are nearly all allocated, reflected by the rise in RSS.
Sun 05 Jan 2025 10:30:13 AM JST: 115760 111616     2  26934  # 100MiB accessed: Final step of allocation. All virtual memory has been committed to physical memory, and demand paging is complete.
Sun 05 Jan 2025 10:30:14 AM JST: demand-paging.pyプロセスは終了しました。 # プロセス終了後、メモリは解放される。ページキャッシュが残る場合は再利用可能。
