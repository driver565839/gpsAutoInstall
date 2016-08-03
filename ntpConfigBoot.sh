#!/bin/bash
echo "Hello Human! I am your friendly NTP boot helper."
echo "Don't mind me, I'll just set up a few things you need to get going!"
echo "Linking PPS to PPS driver..."
modprobe minnow-pps-gpio
echo "Done!"
echo "Establishing link between Serial Port and gps0"
rm /dev/gps0
ln -s /dev/ttyS4 /dev/gps0
chmod 777 /dev/gps0
echo "done"
echo "Restarting NTPD..."
service ntp restart
echo "Done!"
echo "NTP is now configured on this machine."
echo "Please allow a few minutes for the clock to synchronize."
echo "Otherwise I'm all done so Good-bye!"
