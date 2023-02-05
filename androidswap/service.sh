#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

#enable swap
swapon /data/swap/swap

#some perfomance tunning


###
### IMPROVE SYSTEM MEMORY MANAGEMENT ###
###

# Do less swapping
echo 10 > /proc/sys/vm/swappiness
echo 30 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio

# specifies the minimum virtual address that a process is allowed to mmap
echo 4096 > /proc/sys/vm/mmap_min_addr

# 50% overcommitment of available memory
echo 50 > /proc/sys/vm/overcommit_ratio
echo 0 > /proc/sys/vm/overcommit_memory

# Keep at least 64MB of free RAM space available
echo 65535 > /proc/sys/vm/min_free_kbytes
#some killing needs to happen
echo "0,2,5,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
echo "3755,6144,9387,14336,17284,21240" > /sys/module/lowmemorykiller/parameters/minfree
