#!/binbash
restplymouth(){
#reset plymouthlogo if dist-upgrade change logo
sudo rm /lib/plymouth/themes/default. plymouth
sudo ln -s /lib/plymoouth/themes/drubuntu/drubuntu.plymouth /lib/plymouth/default.plymouth
}
echo "We'll install unity for you now. This may take a while."
echo ""
echo "Your System will reboot when we are ready!"
apt -y -qq install ubuntu-desktop^ 
apt -y dist-upgrade >>/dev/null 2>&1
restplymouth
rm -- "$0"
reboot -p
exit
