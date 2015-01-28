#!/bin/bash
setlightdm(){
xsessionpath=/usr/share/xsessions/
desktopfile=Lubuntu.desktop
xession=$xsessionpath$desktopfile 
lightdmfile=/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
if [ -f $xsession ];then
rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF>>"$lightdmfile"
user-session=Lubuntu
EOF
fi
	
}

restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
echo "LXDE is installing..."
echo ""
echo "Your System will reeboot when we are ready!"

apt --force-yes -y -qq  install  --no-install-recommends lubuntu-desktop^ lubuntu-software-center >>/dev/null 2>&1
apt-get dist-upgrade >>/dev/null 2>&1
resetplymouth
	rm -- "$0"
	reboot -p
	exit

