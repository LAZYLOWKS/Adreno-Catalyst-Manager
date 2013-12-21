#!/system/bin/sh
##############################################################################
# Copyright © 2013 @ Pizza_Dox                                               #
# Adreno Catalyst Manager™ Created by Pizza_Dox                              #
# Do not Steal this Script or Any Scripts being Installed!                   #
# For more Info Please view the GPL: http://www.gnu.org/licenses/gpl-3.0.txt #
##############################################################################
# Changelog                                                                  #
# * Build 1:                                                                 #
# - Base script                                                              #
# - Broken                                                                   #
# * Build 2:                                                                 #
# - Fixed all bugs, Installs and Uninstalls properly                         #
# * Build 3:                                                                 #
# - Exits and reboots properly                                               #
# * Build 4:                                                                 #
# - Coded script to edit GPU Clock speed                                     #
# * Build 5:                                                                 #
# - Added GPU Cache Dump & GPU Optimized                                     #
# * Build 6:                                                                 #
# - Fixed some tiny errors in typing and bug fixes                           #
# * Build 7:                                                                 #
# - Fixed Layouts of Text                                                    #
# - Main ACM Binary script not working, crashes when executing option        #
# * Build 8:                                                                 #
# - Fixed Sleep syntax bugs                                                  #
# * Build 9:                                                                 #
# - Rebuilt from scratch                                                     #
# - Many new features                                                        #
# - Still chucks errors when executing & breaks                              #
# * Build 10:                                                                #
# - Rebuilt code layout                                                      #
# - Fixed many stupid bugs                                                   #
##############################################################################
sleep 1;
clear
echo " ";
title=ACM Installer V1 Alpha B10
while true; do
$title
echo " ";
echo "Options:"
echo " ";
echo "[I]nstall ACM";
echo "[U]ninstall ACM";
echo "[R]eboot ACM";
echo "[E]xit ACM";
echo " "
echo -n "What would you like to do? "
read Install_Options
echo " "
case "$Install_Options" in
	i|I)
	echo "Installing ACM...";
cat >> /mnt/sdcard/acm_temp.sh <<EOF
#!/system/bin/sh
while true; do
echo "Adreno Catalyst Manager Version 1.0";
echo "by Pizza_Dox";
sleep 0.5;
echo " ";
echo "Control Pannel:";
echo "[C]lock speed management";
echo "[D]rop vRam cache";
echo "[P]ptimize GPU Settings for Performance";
echo "[Q]ptimize GPU Settings for Quality";
echo "[E]xit";
echo "[R]eboot";
echo -n "What would you like to do?";
read Control_Options
case "$Control_Options" in
	c|C)
	echo "GPU Clock speed available:";
	echo "[1] 200 MHz";
	echo "[2] 320 MHz";
	echo "[3] 389 MHz";
	echo "[4] 450 MHz";
	read gpuclkinput
	sleep 1;
	case "$gpuclkinput" in
	echo -n "Choose clock speeds:";
	1|1)
	echo "GPU Value injected!";
	echo "200000000" > /sys/class/kgsl/kgsl/kgsl-3d0/max_gpuclk
	2|2)
	echo "GPU Value injected!";
	echo "320000000" > /sys/class/kgsl/kgsl/kgsl-3d0/max_gpuclk
	3|3)
	echo "GPU Value injected!";
	echo "389000000" > /sys/class/kgsl/kgsl/kgsl-3d0/max_gpuclk
	4|4)
	echo "GPU Value injected!";
	echo "450000000" > /sys/class/kgsl/kgsl/kgsl-3d0/max_gpuclk
	d|D)
	echo "vRam cache dropped!";
	sync;
	echo "3" > /proc/sys/vm/drop_caches;
	p|P)
	echo "GPU Settings set for Performance!";
	setprop hw3d.force 1
	setprop debug.egl.hw 1
	setprop debug.egl.profiler 1
	setprop debug.sf.hw 1
	setprop debug.composition.type gpu
	setprop debug.performance.tuning 1
	setprop com.qc.hardware 1
	setprop debug.qc.hardware true
	setprop debug.qctwa.preservebuf 1
	setprop persist.sys.use_16bpp_alpha 1
	setprop persist.sys.use_dithering 0
	q|Q)
	echo "GPU Settings set for Quality!";
	setprop persist.sys.use_dithering 1
	r|R)
	reboot
	;;
	e|E)
	echo "Buh Bye!";
	exit 0
	*)
    echo " "
    echo "Dude! U Drunk?"
    sleep 2
    ;;
esac
done
# XDA: http://goo.gl/m3vV48
# Blog: http://androidpizza.blogspot.com/
# Email: diamond.nigel75@Gmail.com
EOF
	sync; busybox mount -o remount,rw /system
	cp /mnt/sdcard/acm_temp.sh /system/xbin/acm
	chown 0.0 /system/xbin/acm
	chmod 777 /system/xbin/acm
	rm /mnt/sdcard/acm_temp.sh 2>/dev/null;
	sleep 1;
	echo "Installation complete, a reboot is suggested!";
	;;
	u|U)
	echo "?Un-installing ACM...";
	sync; busybox mount -o remount,rw /system
	rm /system/xbin/acm 2>/dev/null;
	echo "Un-install complete, a reboot is suggested!";
	;;
	e|E)
	echo "Buh Bye!";
	exit 0
	*)
	r|R)
	reboot
	;;
    echo " "
    echo "Dude! U Drunk?"
    sleep 2
    ;;
esac
done
# XDA: http://goo.gl/m3vV48
# Blog: http://androidpizza.blogspot.com/
# Email: diamond.nigel75@Gmail.com