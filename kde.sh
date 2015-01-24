#!/bin/bash
restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
installdesktop(){
apt -y  install kde-plasma-desktop 	 
apt -y dist-upgrade 	
}
#code to keep lightdm the default display manager
sudo rm -f /etc/X11/default-display-manager
echo "debconf debconf/priority select critical"                | sudo debconf-set-selections
echo "lightdm shared/default-x-display-manager select lightdm" | sudo debconf-set-selections
echo "kdm shared/default-x-display-manager select lightdm"     | sudo debconf-set-selections
sudo rm -f /etc/lightdm/lightdm.conf  #Start anew
sudo apt-get -y install lightdm &>/dev/null
echo "debconf debconf/priority select high"                    | sudo debconf-set-selections
#END
echo "Installing KDE ..."
echo ""
echo "Your System will reboot when installation is finished."
installdesktop
restplymouth
      rm -- "$0"
		reboot -p
		exit
