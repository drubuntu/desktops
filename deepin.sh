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
sudo gpg --export --armor | sudo apt-key add -
sudo apt -y update;sudo apt -y upgrade  
sudo apt -y install  deepin-installer
  
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
