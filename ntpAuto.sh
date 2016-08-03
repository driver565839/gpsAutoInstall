#!/bin/bash
echo "Welcome to the NTP Auto-configurer"
echo "If any part of this install fails, please ensure the permissions on this file allow for all the installations."
echo "Installing needed packages...."
add-apt-repository main 
add-apt-repository universe
add-apt-repository restricted
add-apt-repository multiverse
apt-get update
apt-get install pps-tools
apt-get install libcap-dev
apt-get install dkms
apt-get install ntp
apt-get install minicom
apt-get install git
apt-get install setserial
echo "Establishing PPS source"
mkdir Minnow
cd Minnow
git clone https://github.com/bsteinsbo/Minnowboard.git
cd Minnowboard/minnow-pps-gpio
nano minnow-pps-gpio.c
make
chmod 777 Makefile
./Makefile
nano /etc/modules
echo "Establishing GPS source"
dkms add -m minnow-pps-gpio/20150721
dkms build minnow-pps-gpio/20150721
dkms install minnow-pps-gpio/20150721
modprobe minnow-pps-gpio
setserial -g /dev/ttyS4
ln -s /dev/ttyS4 /dev/gps0
chmod 777 /dev/gps0
nano /etc/ntp.conf
nano /etc/apparmor.d/usr.sbin.ntpd
nano /etc/rc.local
echo "All done! Please reboot now by entering the command <reboot>"
