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
 
tput cup 5 22
# Set reverse video mode
tput rev
echo -e " ${red}  ${choosedesktopmssg} ${NC}"

tput sgr0
 
tput cup 6 22
echo "1. Cinnamon"

tput cup 7 22
echo "2. Enlightenment (currently not redy for 16.04)"

tput cup 8 22
echo "3. Gnome 3"

tput cup 9 22
echo "4. KDE"

tput cup 10 22
echo "5. LXDE"

tput cup 11 22
echo "6. Mate"

tput cup 12 22
echo "7. Evolve"

tput cup 13 22
echo "8. Unity"

tput cup 14 22
echo "9. Xfce"

tput cup 15 22 
echo "10 Pantheon (currently not stable for 16.04 use daily on your own risk!)"
tput cup 18 22 
echo -e  "${green}  ${xtoexitmssg} ${NC}"


# Set bold mode 
tput bold
tput cup 20 22
echo -e -n " ${white}  ${choosemssg} ${NC}"
tput cup 22 22
echo -e -n " ${lightred}  ${notmorethanonedesktopmssg} ${NC}"

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
apt-get -y -qq --force-yes --assume-yes  install cinnamon >>/dev/null 2>&1
apt -y -qq -q dist-upgrade && apt -y -qq -q full-upgrade >>/dev/null 2>&1 
reboot
        show_menu;
        ;;


        
        2) clear;
echo "Installing Enlightenment ..."

add-apt-repository -y ppa:niko2040/e19 >>/dev/null 2>&1
apt update >>/dev/null 2>&1
apt -y install enlightenment >>/dev/null 2>&1
apt -y install terminology >>/dev/null 2>&1
apt -y -qq -q dist-upgrade >>/dev/null 2>&1 && apt -y -qq -q full-upgrade >>/dev/null 2>&1 
reboot           show_menu;
            ;;

        

        3) clear;
		    	
echo "Installing Gnome3 ..."
echo "Your System will reeboot when we are ready!"
apt -y -qq -q install ubuntu-gnome-desktop >>/dev/null 2>&1 &&
apt -y -qq -q dist-upgrade && apt -y -qq -q full-upgrade >>/dev/null 2>&1 && 
reboot          
               show_menu;           
;;

	4) clear;
echo "Installing KDE ..."
echo "Your System will reeboot when we are ready!"
cat coffee.txt
echo "KDE is really big. So take your time and grap some coffee!"








add-apt-repository -y ppa:kubuntu-ppa/backports >>/dev/null 2>&1 &&
apt update >>/dev/null 2>&1 &&  
apt -y install kubuntu-desktop >>/dev/null 2>&1 &&
apt -y dist-upgrade >>/dev/null 2>&1 &&
apt -y full-upgrade   >>/dev/null 2>&1 &&
reboot 
 show_menu;            
;;

	5) clear;
echo "Installing LXDE ..."
echo "Your System will reeboot when we are ready!"

apt -y -qq install lubuntu-desktop >>/dev/null 2>&1 &&
reboot
 show_menu;
            ;;
    
    	6) clear;
echo "Installing MATE ..."
echo "Your System will reeboot when we are ready!"

apt -y -qq install mate-desktoop >>/dev/null 2>&1 &&
reboot
       
    show_menu;
            ;;
         
    	7) clear;
   echo "Installing Evolve ..."
echo "Your System will reeboot when we are ready!"
sudo apt-add-repository -y ppa:sukso96100/budgie-desktop >>/dev/null 2>&1
apt update >>/dev/null 2>&1 
apt  -y --force-yes -qq  install  budgie-desktop >>/dev/null 2>&1 
reboot
       show_menu;
            ;;
    
	8) clear;
   echo "Installing Ubuntus default desktop Unity ..."
apt -y -qq ubuntu-desktop            ;;
    
 	9) clear;
   echo "Installing XUbuntu ..."
echo "Your System will reeboot when we are ready!"
sudo apt-get -y -qq install xubuntu-desktop gksu leafpad synaptic >>/dev/null 2>&1
reboot

    show_menu;
            ;;
    
  10) clear;
   echo "Installing Elementary OS ..."
echo "Your System will reeboot when we are ready!"

lightdm >>/dev/null 2>&1
apt-add-repository -y ppa:elementary-os/daily >>/dev/null 2>&1 
apt-add-repository -y ppa:elementary-os/os-patches >>/dev/null 2>&1
apt update >>/dev/null 2>&1
apt-get -y -qq install elementary-desktop >>/dev/null 2>&1
apt-get -y remove unity-greeter >>/dev/null 2>&1
dpkg-reconfigure pantheon-greeter >>/dev/null 2>&1
apt -y dist-upgrade >>/dev/null 2>&1 && apt- y full-upgrade >>/dev/null 2>&1

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
