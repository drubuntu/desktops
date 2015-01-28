#!/bin/bash
restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
installdesktop(){
apt --force-yes -y -qq   install kde-plasma-desktop 	 
apt -y dist-upgrade 	
}
echo "Installing KDE ..."
echo ""
echo "Your System will reboot when installation is finished."
installdesktop
restplymouth
      rm -- "$0"
		reboot -p
		exit
