#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="RyukillerZ"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
#Domain
domain=$(cat /usr/local/etc/xray/domain)
IPVPS=$(curl -s ipinfo.io/ip)
# USERNAME
rm -f /usr/bin/user
username=$( curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}' )
echo "$username" > /usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$( curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $3}' )
echo "$user" > /usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$( curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}' )
echo "$valid" > /usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear

# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Active)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(( (d1 - d2) / 86400 ))
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
dmon="$(vnstat -i eth0 -m | grep "$(date +"%b '%y")" | awk '{print $3" "substr ($4, 1, 1)}')"
# STATUS Running
vless=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $vless == "running" ]]; then
    status_xray="${green}running"$NC" ✓"
else
    status_xray="${red}not running (Error)"$NC" "
fi
# STATUS Running
vless=$( systemctl status xray@none | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $vless == "running" ]]; then
    status_xray1="${green}running"$NC" ✓"
else
    status_xray1="${red}not running (Error)"$NC" "
fi
#XRAY CORE VERSION
xray_service=$(systemctl status xray.service | grep ".js" | sed -n '1p' | awk '{print $2}')
xray_version=$($xray_service --version | sed -n '1p' | awk '{print $2}')
echo "$xray_version"
# RAM Info
ram_used=$(free -m | grep Mem: | awk '{print $3}')
total_ram=$(free -m | grep Mem: | awk '{print $2}')
ram_usage=$(echo "scale=2; ($ram_used / $total_ram) * 100" | bc | cut -d. -f1)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
clear
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
clear
# TOTAL ACC CREATE  VLESS WS
vlessws=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
echo -e "\e[$banner_colour"
figlet -f $ascii "$banner"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                    \e[30m[\e[$box SERVER INFORMATION\e[30m ]\e[1m                  \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Cpu Model            :$cname"
echo -e "  \e[$text Cpu Frequency        :$freq MHz"
echo -e "  \e[$text Number Of Core       : $cores"
echo -e "  \e[$text Operating System     : "$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)
echo -e "  \e[$text Kernel               : $(uname -r)"
echo -e "  \e[$text RAM Usage            : ${total_ram} / ${ram_used} (${ram_usage}%)"
echo -e "  \e[$text Ip Vps/Address       : $IPVPS"
echo -e "  \e[$text Domain Name          : $domain\e[0m"
echo -e "  \e[$text Client Name          : $username"
echo -e "  \e[$text Order ID             : $oid"
echo -e "  \e[$text Xray Core Version    : $xray_version\e[0m"
echo -e "  \e[$text Expired Status       : $exp $sts"
echo -e "  \e[$text Certificate Status   : Expired in $certifacate days"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                        \e[30m[\e[$box LIST ACCOUNTS\e[30m ]\e[1m                   \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e  "      \e[$number               VLESS-WS :\e[m \e[$text $vlessws Acc\e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                        \e[30m[\e[$box MAIN MENU\e[30m ]\e[1m                       \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$number (•1)\e[m \e[$below XRAY VLESS\e[m                    \e[$number (•8)\e[m \e[$below AUTO BACKUP\e[m"
echo -e "  \e[$number (•2)\e[m \e[$below CLEAR LOG VPS\e[m                 \e[$number (•9)\e[m \e[$below RESTART XRAY\e[m"
echo -e "  \e[$number (•3)\e[m \e[$below ALL TELCO\e[m                     \e[$number (10)\e[m \e[$below SPEEDTEST VPS\e[m"
echo -e "  \e[$number (•4)\e[m \e[$below MAXIS & DIGI CELCOM\e[m           \e[$number (11)\e[m \e[$below CHECK RUNNING\e[m"
echo -e "  \e[$number (•5)\e[m \e[$below SYSTEM MENU\e[m                   \e[$number (12)\e[m \e[$below INFO ALL PORT\e[m"
echo -e "  \e[$number (•6)\e[m \e[$below ADD DNS NETFLIX\e[m               \e[$number (13)\e[m \e[$below CHANGE PORT\e[m"
echo -e "  \e[$number (•7)\e[m \e[$below UPDATE XRAY CORE\e[m              \e[$number (14)\e[m \e[$below DELETE VLESS EXP\e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$below Premium VPS by $creditt"
echo -e "  \e[$below Thank you for using script by PAKYAVPN"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "\e[$below "
read -p " Select menu :  " menu
echo -e ""
case $menu in
1)
    xraay
    ;;
2)
    clear-log
    ;;
3)
    telco
    ;;
4)
    maxisdigi
    ;;
5)
    system
    ;;
6)
    dns
    ;;
7)
    wget -q -O /usr/bin/xraycore https://raw.githubusercontent.com/RyukillerZ/backdoor/main/add-user/xraycore.sh && chmod +x /usr/bin/xraycore && xraycore
    ;;
8)
    autobackup 
    ;;
9)
    restart
    ;;
10)
    speedtest
    ;;
11)
    check-sc
    ;;
12)
    info
    ;;
13)
    port-xray
    ;;
14)
    xp
    ;;    
x)
    clear
    exit
    echo -e "\e[1;31mPlease Type menu For More Option, Thank You\e[0m"
    ;;
*)
    clear
    echo -e "\e[1;31mPlease enter an correct number\e[0m"
    sleep 1
    menu
    ;;
esac
