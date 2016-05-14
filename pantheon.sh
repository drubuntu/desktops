#!/bin/bash
echo "Installing Pantheon ..."
echo ""
path=/etc/apt/sources.list.d/
file=elementary-os-daily-trusty.list
check=$path$file
xsessionpath=/usr/share/xsessions/
desktopfile=pantheon.desktop
xession=$xsessionpath$desktopfile
lightdmfile=/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf

removeapps(){
apt-get -y  -qq  remove noise scratch-text-editor midori-granite  auduíence geary pantheon-photos simple-scan maya-calnedar snap-photobooth
}
setlightdm(){
if [ -f $xsession ];then
rm -r 60-lightdm-gtk-greeter.conf
cat <<EOF>>"$lightdmfile"
user-session=pantheon
EOF
fi
  
}
restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
addrepo(){
apt -y install xorg
sleep 5
apt-add-repository -y ppa:gnome3 &&
apt-add-repository -y ppa:gnome3 saging &&
apt-add-repository -y ppa:elementary/stable &&
apt-add-repository -y ppa:elementary/os patches &&
apt update &&
apt-get -y remove unity-greeter &&
dpg-reconfigure pantheon-greeter &&
apt-get upgrade;apt-get dist-upgrade
apt-get -y --force-yes   -qq  install  elementary-desktop
removeapps
setlightdm
resetplymouth  
}
installdesktop(){
apt update;apt -y upgrade;apt -y dist-upgrade
apt-get -y --force-yes   -qq  install  elementary-desktop

removeapps
setlightdm
resetplymouth  
}

if ! [ -f $check ] ;then
addrepo
else
installdesktop
fi

echo ""
echo "Your System will reeboot when we are ready!"
rm -- "$0"
reboot -p
exit	
