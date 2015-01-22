#!/bin/bash
echo "Installing Cinnamon ..."
echo ""
echo "Your System will reeboot when  we are ready!"

path=/etc/apt/sources.list.d/
file=lestcape-cinnamon-trusty.list
check=$path$file


addrepo(){
add-apt-repository -y ppa:lestcape/cinnamon >>/dev/null 2>&1
apt-get update >>/dev/null 2>&1
apt -y -q install cinnamon 
}
installdesktop(){
apt -y -q install cinnamon 
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
