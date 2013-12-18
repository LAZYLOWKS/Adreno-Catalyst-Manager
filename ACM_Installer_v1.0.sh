#!/system/bin/sh
##############################################################################
# Copyright © 2013 @ Pizza_Dox                                               #
# Hyper Cola™ Created by Pizza_Dox                                           #
# Do not Steal this Script or Any Scripts being Installed!                   #
# For more Info Please view the GPL: http://www.gnu.org/licenses/gpl-3.0.txt #
##############################################################################
# Dox Shell 1.1 by Pizza_Dox
cls=clear
ver=1.0
# End of Dox Shell

# Changelog
# * Build 1:
# - Base script
# - Broken
# * Build 2:
# - Fixed all bugs, Installs and Uninstalls properly
# * Build 3:
# - Exits and reboots properly
# * Build 4:
# - Coded script to edit GPU Clock speed
# * Build 5:
# - Added GPU Cache Dump & GPU Optimized
# * Build 6:
# - Fixed some tiny errors in typing and bug fixes
# * Build 7:
# - Fixed Layouts of Text
# - Main ACM Binary script not working, crashes when executing option
# * Build 8:
# - Fixed Sleep syntax bugs
while true;
do
sleep 1;
$cls
 echo " ";
 echo "ACM Installer Version $ver";
sleep 0.5;
 echo "by Pizza_Dox";
 echo " ";
sleep 2;
 echo "Options:";
sleep 0.5;
 echo "[I] = Install ACM $ver";
sleep 0.5;
 echo "[U] = Uninstall ACM $ver";
sleep 0.5;
 echo "[R] = Reboot";
sleep 0.5;
 echo "[E] = Exit";
sleep 0.5;
 echo -n "What would ya like to do?: ";	
read input
if [ "$input" = "I" ]; then
$cls
sleep 0.5;
 echo "Installing ACM $ver..."
sleep 1;
 echo " ";
cat >> /mnt/sdcard/acm.sh <<EOF
#!/system/bin/sh
sleep 1;
 echo " ";
 echo "Adreno Catalyst Manager Version 1.0";
sleep 0.5;
 echo "by Pizza_Dox";
 echo " ";
sleep 2;
clear
 echo "AMC is a GPU Manager.";
 echo " "
 echo "Terms and Conditions:"
 echo "/*
* Your warranty is now void... Duh!?
*
* I am not responsible for thermonuclear war,
* random bootloops, you getting dumped
* by your S.O or you getting fired because your
* phone bootloops and alarm does not go off.
* Please do some research if you have any
* concerns about features included in
* my mod before using it! YOU and only
* YOU are choosing to make these modifications.
*/"
sleep 6;
clear
sleep 0.5;
 echo "Adreno Catalyst Manager Options:";
sleep 0.2;
 echo "[C]lock speed management";
sleep 0.2;
 echo "[D]rop caches to free up VRam";
sleep 0.2;
 echo "[O]ptimized GPU configuration";
sleep 0.2;
 echo "[E]xit"; 
sleep 0.2;
 echo -n "Enter option: ";	
read optioninput
if [ "$optioninput" = "C" ]; then
clear
sleep 0.5;
 echo "Clock Speed Management"
sleep 0.2;
 echo " "
 echo "Clock Speeds:"
sleep 0.2;
 echo " "
sleep 1;
 echo "[1] 450 MHz";
 echo "[2] 389 MHz";
 echo "[3] 320 MHz";
 echo "[4] 200 MHz";
sleep 1;
 echo -n "Enter option: ";
read gpuclkinput
if [ "$gpuclkinput" = "1" ]; then
echo "450000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
sleep 2;
 echo "GPU Frequency injected..."
sleep 0.5;
clear
fi
if [ "$gpuclkinput" = "2" ]; then
echo "389000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
sleep 2;
 echo "GPU Frequency injected..."
sleep 0.5;
clear
fi
if [ "$gpuclkinput" = "3" ]; then
echo "320000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
sleep 2;
 echo "GPU Frequency injected..."
sleep 0.5;
clear
fi
if [ "$gpuclkinput" = "4" ]; then
echo "200000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
sleep 2;
 echo "GPU Frequency injected..."
sleep 0.5;
clear
fi
fi
if [ "$optioninput" = "D" ]; then
clear
sleep 0.5;
 echo "Droping caches...";
sleep 1
echo 3 > /proc/sys/vm/drop_caches;
 echo "Caches dropped!";
fi
if [ "$optioninput" = "O" ]; then
clear
sleep 0.5;
 echo "Optimizing GPU...";
sleep 0.5;
setprop persist.sys.NV_FPSLIMIT 60
setprop persist.sys.NV_POWERMODE 1
setprop persist.sys.NV_PROFVER 15
setprop persist.sys.NV_STEREOCTRL 0
setprop persist.sys.NV_STEREOSEPCHG 0
setprop persist.sys.NV_STEREOSEP 20
setprop hw3d.force 1
setprop hw2d.force 1
setprop debug.performance.tuning 1
setprop debug.gr.numframebuffers 3
setprop debug.sf.hw 1
setprop video.accelerate.hw 1
sleep 1;
 echo "GPU Optimized!";
fi
if [ "$optioninput" = "E" ]; then
clear
sleep 0.5;
 echo "Bye, Bye, :)";
sleep 0.5;
exit 0
fi
# XDA: http://goo.gl/m3vV48
# Blog: http://androidpizza.blogspot.com/
# Email: diamond.nigel75@Gmail.com
EOF
sync
busybox mount -o remount,rw /system;
cp /mnt/sdcard/acm.sh /system/xbin/acm
chown 0.0 /system/xbin/acm
chmod 777 /system/xbin/acm
rm /mnt/sdcard/acm.sh 2>/dev/null;
sleep 2;
 echo "Yay, Installation was successful!";
 echo "To run ACM, type this into a shell:";
 echo "su -c acm";
sleep 0.5;
fi
if [ "$input" = "U" ]; then
$cls
sleep 0.5;
 echo "Uninstalling ACM $ver";
rm /system/xbin/acm 2>/dev/null;
sleep 2;
 echo "Done!, :P";
fi
if [ "$input" = "R" ]; then
sleep 0.5;
 echo "Ham!";
sleep 0.5;
reboot;
fi
if [ "$input" = "E" ]; then
$cls
sleep 0.5;
 echo "Bye, Bye, :)";
sleep 0.5;
exit 0
fi
elseif
done
# XDA: http://goo.gl/m3vV48
# Blog: http://androidpizza.blogspot.com/
# Email: diamond.nigel75@Gmail.com
