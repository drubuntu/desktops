#!/bin/bash
echo "Installing Cinnamon ..."
echo ""
echo "Your System will reeboot when  we are ready!"

path=/etc/apt/sources.list.d/
file=lestcape-cinnamon-trusty.list
check=$path$file


addrepo(){
sudo apt-get install xorg lightdm
add-apt-repository -y  ppa:embrosyn/cinnamon >>/dev/null 2>&1
apt-get update >>/dev/null 2>&1
installdesktop 
}
installdesktop(){
sudo apt -y  install cinnamon 
sudo apt-get -y -qq dist-upgrade
}
if  ! [ -f $check ] ;then
addrepo
else
installdesktop
fi
echo ""

 		rm -- "$0"
      reboot -p
        exit		  
