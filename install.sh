#!/bin/sh
clear
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y
apt-get install libjpeg-dev zlib1g-dev -y
cd /etc/
git clone https://github.com/salampahah/jembut.git
pip3 install -r /etc/jembut/requirements.txt
### Magelang Phreaker Bash Decryptor 2027
clear
read -e -p "[*] Input Nama Luuu   : " nama
read -e -p "[*] Input Bot Token   : " bottoken
read -e -p "[*] Input Id Telegram : " admin
#Decrypted by Yaddy D Phreaker
sed -i "s/NAMA STORE/$nama/g" /etc/jembut/config.json &> /dev/null
sed -i "s/BOT TOKEN/$bottoken/g" /etc/jembut/config.json &> /dev/null
sed -i "s/ID TELEGRAM/$admin/g" /etc/jembut/config.json &> /dev/null
 
cat > /etc/systemd/system/jembut.service << END
[Unit]
Description=SGDO
After=network.target

[Service]
WorkingDirectory=/etc/jembut
ExecStart=/usr/bin/python3 -m main
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable jembut
systemctl start jembut

cd
rm install.sh
echo -e "Sukses Create Panel BOT Digital Ocean /start di bot untuk mulai"
