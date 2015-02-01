#!/bin/bash
echo "Installing Evolve ..."
echo ""
echo "Your System will reeboot when we are ready!"
path=/etc/apt/sources.list.d/
file=evolve-os-ppa-trusty.list
check=$path$file
addrepo(){
sudo apt-add-repository -y ppa:sukso96100/budgie-desktop >>/dev/null 2>&1
apt update >>/dev/null 2>&1 
apt  -y --force-yes -qq  install  budgie-desktop 
}
installdesktop(){
apt  -y --force-yes -qq install  budgie-desktop 
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
