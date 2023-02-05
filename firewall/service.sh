#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

#wait for boot to complete and network to start
until [ $(getprop sys.boot_completed 2>/dev/null) = 1 ] && [ $(getprop init.svc.netd 2>/dev/null) == "running" ]
do
        sleep 1
done

$MODDIR/system/bin/firewall start
