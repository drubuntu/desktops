#!/bin/bash
path=/etc/apt/sources.list.d/
file=enlightenment.list
check=$path$file

addrepo(){
sh -c 'echo "deb http://packages.bodhilinux.com/bodhi trusty main" >> /etc/apt/sources.list.d/enlightenment.list'
apt  update >>/dev/null 2>&1
apt --force-yes -y -qq  install packagekit 
apt --force-yes -y -qq install bodhi-desktop 
}
installdesktop(){
apt  -y --force-yes -qq install packagekit 
apt  -y --force-yes -qq install bodhi-desktop 
}

install(){
if  ! [ -f $check ] ;then
addrepo
else
installdesktop
fi
}
echo "We'll install Enligtenment for you now. This may take a while. Be patient please"
echo ""
echo "System will reboot when we are ready"
install
setlightdm
rm -- "$0"
reboot -p
exit
