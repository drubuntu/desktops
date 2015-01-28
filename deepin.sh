#!/bin/bash
echo "Installing Deepin ..."
echo ""
echo "Your System will reeboot when we are ready!"
path=/etc/apt/sources.list.d/
file=deepin.list
check=$path$file
addrepo(){
sh -c 'echo "deb http://packages.linuxdeepin.com/deepin trusty main non-free universe" >> /etc/apt/sources.list.d/deepin.list' 
apt-get update >>/dev/null 2>&1
apt-get install --force-yes -y -qq deepin-desktop-environment >>/dev/null 2>&1
}
installdesktop(){
apt-get install --force-yes -y -qq deepin-desktop-environment >>/dev/null 2>&1
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
