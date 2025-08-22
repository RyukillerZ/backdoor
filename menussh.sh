#!/bin/bash
N='\e[0m'
yell='\e[1;33m'
clear
#Domain
domain=$(cat /usr/local/etc/xray/domain)
IPVPS=$(curl -s ipinfo.io/ip)
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
echo -e "  \e[$text Status Vless Tls     : ${status_xray}\e[0m"
echo -e "  \e[$text Status Vless Ntls    : ${status_xray1}\e[0m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                        \e[30m[\e[$box LIST ACCOUNTS\e[30m ]\e[1m                   \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e  "\e[$number        SSH-WS :\e[m \e[$text $total_ssh Acc\e[m       \e[$number    VLESS-WS :\e[m \e[$text $vlessws Acc\e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                        \e[30m[\e[$box MAIN MENU\e[30m ]\e[1m                       \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$number (•1)\e[m \e[$below XRAY VLESS\e[m                    \e[$number (•9)\e[m \e[$below RESTART XRAY\e[m"
echo -e "  \e[$number (•2)\e[m \e[$below OPENSSH & OPENVPN\e[m             \e[$number (10)\e[m \e[$below SPEEDTEST VPS\e[m"
echo -e "  \e[$number (•3)\e[m \e[$below ALL TELCO\e[m                     \e[$number (11)\e[m \e[$below CHECK RUNNING\e[m"
echo -e "  \e[$number (•4)\e[m \e[$below MAXIS & DIGI CELCOM\e[m           \e[$number (12)\e[m \e[$below INFO ALL PORT\e[m"
echo -e "  \e[$number (•5)\e[m \e[$below SYSTEM MENU\e[m                   \e[$number (13)\e[m \e[$below CHANGE PORT\e[m"
echo -e "  \e[$number (•6)\e[m \e[$below ADD DNS NETFLIX\e[m               \e[$number (14)\e[m \e[$below CLEAR LOG VPS\e[m"
echo -e "  \e[$number (•7)\e[m \e[$below Check RAM & CPU Usage\e[m         \e[$number (15)\e[m \e[$below REBOOT VPS\e[m"
echo -e "  \e[$number (•8)\e[m \e[$below AUTO BACKUP\e[m                   \e[$number (16)\e[m \e[$below DELETE VLESS EXP\e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$below Premium VPS by @anakjati567"
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
    ssh
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
    gotop
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
    clear-log
    ;;
15)
    reboot
        ;;
16)
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
