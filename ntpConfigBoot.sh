#Copyright 2016 Netgate
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

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
