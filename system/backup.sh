#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="RyukillerZ"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
echo " VPS Data Backup"
sleep 1
echo " Directory Created"
mkdir /root/backup
sleep 1
echo " VPS Data Backup Start Now . . ."
clear
echo " Please Wait , Backup In Process Now . . ."
sleep 1
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /usr/local/etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo "VPS Data Backup By PAKYAVPN"
echo "Telegram : https://t.me/anakjati567 /@anakjati567"
echo ""
echo -e "Please Copy Link Below & Save In Notepad

Your VPS IP ( $IP )

$link

If you want to restore data, please enter the link above

Thank You For Using Our Services"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
