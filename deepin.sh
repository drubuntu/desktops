#!/bin/bash
echo "Installing Deepin ..."
echo ""
echo "Your System will reeboot when we are ready!"
path=/etc/apt/sources.list.d/
file=deepin.list
check=$path$file
addrepo(){
sudo sh -c 'echo #Deepin>> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://ftp.fau.de/deepin trusty main non-free universe" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://ftp.fau.de/deepin trusty main non-free universe" >> /etc/apt/sources.list'
wget http://ftp.fau.de/deepin /deepin/project/deepin-keyring.gpg
gpg --import deepin-keyring.gpg
sudo gpg --export --armor 209088E7 | sudo apt-key add -
sudo apt-gett update;sudo apt-get upgrade; sudo apt-ghet dist-upgrade  
}
installdesktop(){
addrepo
}
if ! [ -f $check ] ;then
addrepo
else
installdesktop
fi
echo ""
rm -- "$0"
reboot -p
exit	
