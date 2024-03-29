user="luis"
password=111

export DEBIAN_FRONTEND=noninteractive
setxkbmap es
dpkg-reconfigure console-setup


apt update 
apt upgrade -y
apt install zsh-syntax-highlighting zsh-autosuggestions -y

#Druivers wifi
apt install -y realtek-rtl88xxau-dkms

useradd -m -p $(echo "$password" | openssl passwd -1 -stdin) -s /usr/bin/zsh "$user"
echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip
mv Hack.zip /usr/share/fonts
cd /usr/share/fonts
unzip Hack.zip
rm Hack.zip


cd /root
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cd /tmp
wget https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb
dpkg -i bat*
rm bat*


cd /root
echo "alias cat=bat" >> .zshrc
echo "alias catn=/usr/bin/cat" >> .zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
echo | /root/.fzf/install


rm /home/$user/.zshrc
cp /root/.zshrc /home/$user/
chown $user /home/$user/.zshrc

apt install python3.10-venv -y
cd /opt
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF
./Mobile-Security-Framework-MobSF/setup.sh

cd /home/$user
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cd /root
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


echo "deb http://www.inetsim.org/debian/ binary/" > /etc/apt/sources.list.d/inetsim.list
echo "deb-src http://www.inetsim.org/debian/ source/" >> /etc/apt/sources.list.d/inetsim.list
apt update
apt install inetsim -y

wget -O code.deb  https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i code.deb
rm code.deb

cp /usr/share/wordlists/rockyou.txt.gz /opt/
gzip -d /usr/share/wordlists/rockyou.txt.gz

apt install xclip -y
apt install gobuster -y

updatedb #Actualiza el locate

cd /opt
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3
python3 setup.py install

cd /opt
git clone https://github.com/volatilityfoundation/volatility
cd volatility
python2.7 setup.py install

 pip3 install stegoveritas
 stegoveritas_install_deps

pip3 install osrframework

apt- install software-properties-common -y
apt update

apt-get install synapse -y

userdel -f -r vagrant

shutdown -r now
