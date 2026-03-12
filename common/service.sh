sleep 30

# Universal Thermal Disabler
echo 0 > /sys/class/thermal/thermal_zone*/mode 2>/dev/null

# Disable semua thermal zone secara universal
for zone in /sys/class/thermal/thermal_zone*
do
    echo disabled > $zone/mode 2>/dev/null
done

# Matikan fitur-fitur thermal lainnya
echo 0 > /proc/sys/kernel/sched_boost 2>/dev/null
echo N > /sys/module/msm_thermal/parameters/enabled 2>/dev/null
echo 0 > /sys/module/msm_thermal/core_control/enabled 2>/dev/null
echo 0 > /sys/kernel/msm_thermal/enabled 2>/dev/null

# Disable CPU thermal throttle
for cpu in /sys/devices/system/cpu/cpu*/thermal_throttle/*
do
    echo 0 > $cpu 2>/dev/null
done

# Tambahan: GPU throttle disable (Adreno)
echo 0 > /sys/class/kgsl/kgsl-3d0/throttling 2>/dev/null
echo 0 > /sys/class/kgsl/kgsl-3d0/devfreq/adrenoboost 2>/dev/null

# Disable power throttle
echo N > /sys/module/msm_performance/parameters/touchboost 2>/dev/null
echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled 2>/dev/null

# Matikan pengumpulan statistik I/O pada semua perangkat penyimpanan
for queue in /sys/block/sd*/queue
do
    echo "0" > "$queue/iostats"
done

sleep 5

# Thermal Stop Semi-auto Methode
stop logd
sleep 1
stop android.thermal-hal
sleep 1
stop vendor.thermal-engine
sleep 1
stop vendor.thermal_manager
sleep 1
stop vendor.thermal-manager
sleep 1
stop vendor.thermal-hal-2-0
sleep 1
stop vendor.thermal-symlinks
sleep 1
stop thermal_mnt_hal_service
sleep 1
stop thermal
sleep 1
stop mi_thermald
sleep 1
stop thermald
sleep 1
stop thermalloadalgod
sleep 1
stop thermalservice
sleep 1
stop sec-thermal-1-0
sleep 1
stop debug_pid.sec-thermal-1-0
sleep 1
stop thermal-engine
sleep 1
stop vendor.thermal-hal-1-0
sleep 1
stop vendor-thermal-1-0
sleep 1
stop thermal-hal
sleep 3

# stop thermal service tambahan (universal)
stop sec-thermal-engine 2>/dev/null
stop thermal_manager 2>/dev/null
stop vendor.thermal-hal-3-0 2>/dev/null
stop vendor.thermal-hal-1-1 2>/dev/null

# Thermal Stop Setprop Methode
setprop init.svc.thermal stopped
setprop init.svc.thermal-managers stopped
setprop init.svc.thermal_manager stopped
setprop init.svc.thermal_mnt_hal_service stopped
setprop init.svc.thermal-engine stopped
setprop init.svc.mi-thermald stopped
setprop init.svc.thermalloadalgod stopped
setprop init.svc.thermalservice stopped
setprop init.svc.thermal-hal stopped
setprop init.svc.vendor.thermal-symlinks stopped
setprop init.svc.android.thermal-hal stopped
setprop init.svc.vendor.thermal-hal stopped
setprop init.svc.thermal-manager stopped
setprop init.svc.vendor-thermal-hal-1-0 stopped
setprop init.svc.vendor.thermal-hal-1-0 stopped
setprop init.svc.vendor.thermal-hal-2-0.mtk stopped
setprop init.svc.vendor.thermal-hal-2-0 stopped

# property thermal tambahan
setprop init.svc.sec-thermal-1-0 stopped
setprop init.svc.sec-thermal-engine stopped
setprop init.svc.vendor.thermal-hal-3-0 stopped
setprop init.svc.vendor.thermal-hal-1-1 stopped

# Log untuk debugging
log -t UCAN "UCAN Disable Thermal XPro Engine Activated"