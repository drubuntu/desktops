#!/bin/bash
echo "Installing Pantheon ..."
echo ""
path=/etc/apt/sources.list.d/
file=elementary-os-daily-trusty.list

removeapps(){
apt-get -y  -qq  remove noise scratch-text-editor midori-granite  auduíence geary pantheon-photos simple-scan maya-calnedar snap-photobooth
}

restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
addrepo(){
apt-add-repository -y ppa:gnome3team/gnome3 &&
apt-add-repository -y ppa:gnome3team/gnome3-staging &&
apt-add-repository -y ppa:elementary-os/stable &&
apt-add-repository -y ppa:elementary-os/patches &&
apt update &&
apt-get -qq -y install elemntary-desktop
apt-get -y remove unity-greeter &&
dpkg-reconfigure pantheon-greeter &&
apt -y dist-upgrade && apt- y full-upgrade
}
removeapps
resetplymouth  
}
addrepo

echo ""
echo "Your System will reeboot when we are ready!"
rm -- "$0"
reboot -p
exit	
