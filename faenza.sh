echo "Installing faenza icon theme  ..."
echo ""
echo "Your System will reeboot when we are ready!"
path=/etc/apt/sources.list.d/
file=noobslab-icons-trusty.list
check=$path$file
addrepo(){
add-apt-repository -y ppa:noobslab/icons;
apt-get update;
apt-get install faenza-icon-theme;
apt-get install -y -qq faience-icon-theme
}
installicons(){
apt-get install -y qq faenza-icon-theme;
apt-get install -y -qq faience-icon-theme
  
}
if ! [ -f $check ] ;then
addrepo
else
installicons
fi

exit
