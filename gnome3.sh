#!/bin/bash
echo "Installing Gnome 3 ..."
echo ""
echo "Your System will reeboot when we are ready!"
path=/etc/apt/sources.list.d/
file=gnome-team-gnome3-trusty.list
check=$path$file

restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}

addrepo(){
add-apt-repository -y ppa:gnome3-team/gnome3 >>/dev/null 2>&1
add-apt-repository -y ppa:gnome3-team/gnome3-staging >>/dev/null 2>&1
apt update; apt dist-upgrade
apt --force-yes -y -qq install gnome-core gnome-system-tools gnome-app-install gnome-shell
restplymouth
  }
installdesktop(){
apt --force-yes -y -qq install gnome-shell ubuntu-gnome-desktop 
apt -y dist-upgrade >>/dev/null 2>&1
restplymouth  
}
if ! [ -f $check ] ;then
addrepo
else
installdesktop
fi
restplymouth
reboot -p
exit	
