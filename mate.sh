
#!/bin/bash
path=/etc/apt/sources.list.d/
file=ubuntu-mate-dev-trusty-mate-trusty.list
check=$path$file
addrepo(){
apt-add-repository -y ppa:ubuntu-mate-dev/ppa >/dev/null 1>&2  
apt-add-repository -y ppa:ubuntu-mate-dev/trusty-mate>/dev/null 1>&2  
apt update &&  apt upgrade>/dev/null 1>&2  
apt --force-yes -y -qq  install  ubuntu-mate-core ubuntu-mate-desktop
  
}
installdesktop(){
apt update && apt upgrade>/dev/null 1>&2
apt --force-yes -y -qq  install  ubuntu-mate-core ubuntu-mate-desktop
}

echo "Installing Mate ..."
echo ""
echo "Your System will reeboot when we are ready!"

if ! [ -f $check ] ;then
addrepo
else
installdesktop
fi
echo ""
rm -- "$0"
reboot -p
exit	
