#!/bin/bash

restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
echo "Installing Xfce"
echo ""
echo "We'll install Xfce4 for you now. This may take a while. Be patient please!"
apt -y -qq install xubuntu-desktop 
apt -y dist-upgrade  >>/dev/null 2>&1
restplymouth
 rm -- "$0"
reboot -p
exit
