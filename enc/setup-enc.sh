#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
sudo apt -y update
sudo apt install build-essential -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neurobin/ppa -y
sudo apt install shc
wget -O /usr/bin/shco https://raw.githubusercontent.com/RyukillerZ/backdoor/main/enc/shco.sh
chmod +x /usr/bin/shco
mkdir /root/shc
cd
wget -O /usr/bin/enc https://raw.githubusercontent.com/RyukillerZ/backdoor/main/enc/enc.sh
chmod +x /usr/bin/enc
clear
cd
rm -f setup-enc.sh
clear
echo -e " ${RED}ENC SCRIPT INSTALL DONE ${NC}"
sleep 2
clear
