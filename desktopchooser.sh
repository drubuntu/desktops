#!/bin/bash
#run script for installation and features integration
bdir="/opt/.drubuntu"
$lightdmdir/usr/share/lightdm
AGENT="User-Agent: Mozilla/5.0 (Linux; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
XSESSIONPATH=/USR/SHARE/XSESSIONS/
#-----------------------------
cd ${0%/*}
source $bdir/colors
if [ "$LANG" == "de_DE.UTF-8" ];then
source $bdir/de
else
source $bdir/en
fi

if [ `whoami` != root ]; then
echo -e " ${lightred}  ${runasrootmssg} ${NC}"
    exit
    4
fi

lightdm(){
if ! [ -d $lightdmdir ];then
sudo apt-get -y- qq installl lightdm
fi
}

function download(){
if [ -d $DIRURL ];then
rm -r "$DIRURL"
fi

if ! [ -d $lightdmdir ];then
echo -e " ${lightgreen}  ${prerequmssg} ${NC}"
sudo apt-get -y- qq installl xorg lightdm
fi
cd "$PWD"
sudo dpkg -y --configure  -a 
sudo apt-get -y install  -f 
sudo apt -y full-upgrade 
clear
}

#install pre requirements


show_menu(){
 
# clear the screen
tput clear
tput setab 4
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 19
 
# Set a foreground colour using ANSI escape
tput setaf 7
echo -e " ${blue}  ${desktopchoosermssg} ${NC}"
tput sgr0
 
tput cup 5 20
# Set reverse video mode
tput rev
echo -e " ${red}  ${choosedesktopmssg} ${NC}"

tput sgr0
 
tput cup 7 19
echo "1. Cinnamon"

tput cup 8 19
echo "2. Enlightenment (currently not redy for 16.04)"

tput cup 9 19
echo "3. Gnome 3"

tput cup 10 19
echo "4. KDE"

tput cup 11 19
echo "5. LXDE"

tput cup 12 19
echo "6. Mate"

tput cup 13 19
echo "7. Evolve"

tput cup 14 19
echo "8. Unity"

tput cup 15 19
echo "9. Xfce"

tput cup 16 19 
echo "10 Pantheon"
tput cup 18 19 
echo -e  " ${green}  ${xtoexitmssg} ${NC}"


# Set bold mode 
tput bold
tput cup 18 18
echo -e -n " ${white}  ${choosemssg} ${NC}"
read opt
tput clear
tput sgr0
tput rc
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;

				
echo "Installing Cinnamon ..."
echo ""
echo "Your System will reeboot when  we are ready!"
lightdm
add-apt-repository -y  ppa:embrosyn/cinnamon >>/dev/null 2>&1
apt-get update >>/dev/null 2>&1
apt -y  install cinnamon 
apt-get -y -qq dist-upgrade
reboot
        show_menu;
        ;;


        
        2) clear;
			    
			    sudo bash "$DIRURL"enlightenment.sh 
        rm -r 50-unity-greeter.conf 
cat <<EOF2>>"$lightdmfile"
user-session=enlightenment
EOF2
        
           show_menu;
            ;;

        

        3) clear;
		    	
echo "Your System will reeboot when we are ready!"
apt -y -qq install ubuntu-gnome-desktop&&
reboot
               show_menu;           
;;

	4) clear;
			sudo bash "$DIRURL"kde.sh
	rm -r 50-unity-greeter.conf 
cat <<EOF4>>"$lightdmfile"
user-session=kde-plasma
EOF4
 
 show_menu;            
;;

	5) clear;
echo "Your System will reeboot when we are ready!"

apt -y -qq install kde-desktop &&
reboot
 show_menu;
            ;;
    
    	6) clear;
echo "Your System will reeboot when we are ready!"

apt -y -qq install mate-desktoop&&
reboot
       
    show_menu;
            ;;
         
    	7) clear;
   echo "Installing Evolve ..."
echo ""
echo "Your System will reeboot when we are ready!"
sudo apt-add-repository -y ppa:sukso96100/budgie-desktop >>/dev/null 2>&1
apt update >>/dev/null 2>&1 
apt  -y --force-yes -qq  install  budgie-desktop&& 
reboot
       show_menu;
            ;;
    
	8) clear;
apt -y -qq ubuntu-desktop            ;;
    
 	9) clear;
echo "Your System will reeboot when we are ready!"
sudo apt-get -y -qq install xubuntu-desktop gksu leafpad synaptic&&
reboot

    show_menu;
            ;;
    
  10) clear;
apt-add-repository -y ppa:elementary-os/stable &&
apt-add-repository -y ppa:elementary-os/os-patches &&
apt update &&
apt-get -y -qq install elementary-desktop
apt-get -y remove unity-greeter &&
dpkg-reconfigure pantheon-greeter &&
apt -y dist-upgrade && apt- y full-upgrade
exit

    show_menu;
            ;;
    


        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
    
        show_menu;
        ;;
    esac
fi
done
