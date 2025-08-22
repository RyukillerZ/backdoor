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
# TOTAL ACC CREATE  VLESS WS
total1=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS TCP XTLS
total2=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
MYIP=$(wget -qO- ifconfig.me/ip)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
	domain=$(cat /usr/local/etc/xray/domain)
else
	domain=$IP
fi

# ADD USER VLESS WS
function menu1() {
	clear
	tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2 | sed 's/ //g')"
	none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2 | sed 's/ //g')"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	echo -e "  \e[$back_text           \e[30m[\e[$box CREATE USER XRAY VLESS WS TLS\e[30m ]\e[1m           \e[m"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
	patchtls=/vlessws-tls
	patchnontls=/vlessws-ntls
	uuid=$(cat /proc/sys/kernel/random/uuid)
	read -p "   Bug Address (Example: www.google.com) : " address
	read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
	read -p "   Expired (days) : " masaaktif
	bug_addr=${address}.
	bug_addr2=$address
	if [[ $address == "" ]]; then
		sts=$bug_addr2
	else
		sts=$bug_addr
	fi
	exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
	harini=$(date -d "0 days" +"%Y-%m-%d")
	sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
	sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json
	vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni#${user}"
	vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}"
	systemctl restart xray
	systemctl restart xray@none
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text      \e[30m[\e[$box XRAY VLESS WS\e[30m ]\e[1m          \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks          : ${user}"
	echo -e "Domain           : ${domain}"
	echo -e "IP/Host          : $MYIP"
	echo -e "Port TLS         : $tls"
	echo -e "Port None TLS    : $none"
	echo -e "User ID          : ${uuid}"
	echo -e "Encryption       : None"
	echo -e "Network          : WebSocket"
	echo -e "Path Tls         : $patchtls"
	echo -e "Path None Tls    : $patchnontls"
	echo -e "AllowInsecure    : True/Allow"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link TLS         : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link None TLS    : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created   : $harini"
	echo -e "Expired   : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# TRIAL USER VLESS WS
function menu2() {
	clear
	tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2 | sed 's/ //g')"
	none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2 | sed 's/ //g')"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	echo -e "  \e[$back_text           \e[30m[\e[$box TRIAL USER XRAY VLESS WS TLS\e[30m ]\e[1m            \e[m"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	# Create Expried
	masaaktif="1"
	exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

	# Make Random Username
	user=Trial$(tr </dev/urandom -dc X-Z0-9 | head -c4)

	patchtls=/vlessws-tls
	patchnontls=/vlessws-ntls
	uuid=$(cat /proc/sys/kernel/random/uuid)
	read -p "   Bug Address (Example: www.google.com) : " address
	read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
	bug_addr=${address}.
	bug_addr2=$address
	if [[ $address == "" ]]; then
		sts=$bug_addr2
	else
		sts=$bug_addr
	fi
	harini=$(date -d "0 days" +"%Y-%m-%d")
	sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
	sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json
	vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni#${user}"
	vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}"
	systemctl restart xray
	systemctl restart xray@none
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text     \e[30m[\e[$box TRIAL XRAY VLESS WS\e[30m ]\e[1m     \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks          : ${user}"
	echo -e "Domain           : ${domain}"
	echo -e "IP/Host          : $MYIP"
	echo -e "Port TLS         : $tls"
	echo -e "Port None TLS    : $none"
	echo -e "User ID          : ${uuid}"
	echo -e "Encryption       : None"
	echo -e "Network          : WebSocket"
	echo -e "Path Tls         : $patchtls"
	echo -e "Path None Tls    : $patchnontls"
	echo -e "AllowInsecure    : True/Allow"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link TLS         : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link None TLS    : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created   : $harini"
	echo -e "Expired   : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# DELETE USER VLESS WS
function menu3() {
	clear
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo " Delete User Xray Vless Ws"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi

		if ! [[ ${CLIENT_NUMBER} =~ ^[0-9]+$ ]]; then
			if [ "$(grep -wc ${CLIENT_NUMBER} "/usr/local/etc/xray/config.json")" != '0' ]; then
				harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 4)
				uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 5)
				user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 2)
				exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 3)
				break
			fi
		else
			harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
			uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
			user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
			exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
		fi
	done
	sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
	sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/none.json
	systemctl restart xray
	systemctl restart xray@none
	clear
	echo " Xray Vless Ws Account Deleted Successfully"
	echo " =========================="
	echo " Client Name : $user"
	echo " Expired On  : $exp"
	echo " =========================="
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
#RENEW VLESS WS
function menu4() {
	clear
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo "Renew User Xray Vless Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi

		if ! [[ ${CLIENT_NUMBER} =~ ^[0-9]+$ ]]; then
			if [ "$(grep -wc ${CLIENT_NUMBER} "/usr/local/etc/xray/config.json")" != '0' ]; then
				harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 4)
				uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 5)
				user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 2)
				exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 3)
				break
			fi
		else
			harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
			uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
			user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
			exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
		fi
	done
	read -p "Expired (days): " masaaktif
	now=$(date +%Y-%m-%d)
	d1=$(date -d "$exp" +%s)
	d2=$(date -d "$now" +%s)
	exp2=$(((d1 - d2) / 86400))
	exp3=$(($exp2 + $masaaktif))
	exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
	sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
	sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/none.json
	service cron restart
	clear
	echo ""
	echo " VLESS WS Account Was Successfully Renewed"
	echo " =========================="
	echo " Client Name : $user"
	echo " Expired On  : $exp4"
	echo " =========================="
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# show user vless ws
function menu5() {
	clear
	tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2 | sed 's/ //g')"
	none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2 | sed 's/ //g')"
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi

		if ! [[ ${CLIENT_NUMBER} =~ ^[0-9]+$ ]]; then
			if [ "$(grep -wc ${CLIENT_NUMBER} "/usr/local/etc/xray/config.json")" != '0' ]; then
				harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 4)
				uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 5)
				user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 2)
				exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | grep -w "${CLIENT_NUMBER}" | cut -d ' ' -f 3)
				break
			fi
		else
			harini=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
			uuid=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
			user=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
			exp=$(grep -E "^#vls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
		fi
	done
	patchtls=/vlessws-tls
	patchnontls=/vlessws-ntls
	vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni#${user}"
	vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}"
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text      \e[30m[\e[$box XRAY VLESS WS\e[30m ]\e[1m          \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks          : ${user}"
	echo -e "Domain           : ${domain}"
	echo -e "IP/Host          : $MYIP"
	echo -e "Port TLS         : $tls"
	echo -e "Port None TLS    : $none"
	echo -e "User ID          : ${uuid}"
	echo -e "Encryption       : None"
	echo -e "Network          : WebSocket"
	echo -e "Path Tls         : $patchtls"
	echo -e "Path None Tls    : $patchnontls"
	echo -e "AllowInsecure    : True/Allow"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link TLS         : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link None TLS    : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created   : $harini"
	echo -e "Expired   : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# USER LOGIN VLESS WS
function menu6() {
clear
echo -n > /tmp/other.txt
data=($(cat /usr/local/etc/xray/config.json | grep '^#vls' | cut -d ' ' -f 2))
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e "\\E[0;44;37m      ⇱ XRAY Vless WS User Login ⇲        \E[0m"
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
# old command
#data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
#old command
#jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo -e "\033[0;34m══════════════════════════════════════════\e[m"
fi
rm -rf /tmp/ipvmess.txt
rm -rf /tmp/other.txt
done
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
xraay
}
# CREATE USER VLESS XTLS
function menu7() {
	clear
	xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2 | sed 's/ //g')"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	echo -e "  \e[$back_text            \e[30m[\e[$box CREATE USER XRAY VLESS XTLS\e[30m ]\e[1m            \e[m"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "   Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
	uuid=$(cat /proc/sys/kernel/random/uuid)
	read -p "   Bug Address (Example: www.google.com) : " address
	read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
	read -p "   Expired (days) : " masaaktif
	bug_addr=${address}.
	bug_addr2=$address
	if [[ $address == "" ]]; then
		sts=$bug_addr2
	else
		sts=$bug_addr
	fi
	exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
	harini=$(date -d "0 days" +"%Y-%m-%d")
	sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
	vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
	vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
	systemctl restart xray
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text     \e[30m[\e[$box XRAY VLESS XTLS\e[30m ]\e[1m         \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks        : ${user}"
	echo -e "Domain         : ${domain}"
	echo -e "Ip/Host        : ${MYIP}"
	echo -e "Port Xtls      : $xtls"
	echo -e "User ID        : ${uuid}"
	echo -e "Encryption     : None"
	echo -e "Network        : TCP"
	echo -e "Flow           : Direct & Splice"
	echo -e "AllowInsecure  : True"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Direct  : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Splice  : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created  : $harini"
	echo -e "Expired  : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# TRIAL USER VLESS XTLS
function menu8() {
	clear
	xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2 | sed 's/ //g')"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	echo -e "  \e[$back_text            \e[30m[\e[$box TRIAL USER XRAY VLESS XTLS\e[30m ]\e[1m             \e[m"
	echo -e "  \e[$line═══════════════════════════════════════════════════════\e[m"
	# Create Expried
	masaaktif="1"
	exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

	# Make Random Username
	user=Trial$(tr </dev/urandom -dc X-Z0-9 | head -c4)

	uuid=$(cat /proc/sys/kernel/random/uuid)
	read -p "   Bug Address (Example: www.google.com) : " address
	read -p "   Bug SNI/Host (Example : m.facebook.com) : " sni
	bug_addr=${address}.
	bug_addr2=$address
	if [[ $address == "" ]]; then
		sts=$bug_addr2
	else
		sts=$bug_addr
	fi
	harini=$(date -d "0 days" +"%Y-%m-%d")
	sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
	vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
	vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
	systemctl restart xray
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text    \e[30m[\e[$box TRIAL XRAY VLESS XTLS\e[30m ]\e[1m    \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks        : ${user}"
	echo -e "Domain         : ${domain}"
	echo -e "Ip/Host        : ${MYIP}"
	echo -e "Port Xtls      : $xtls"
	echo -e "User ID        : ${uuid}"
	echo -e "Encryption     : None"
	echo -e "Network        : TCP"
	echo -e "Flow           : Direct & Splice"
	echo -e "AllowInsecure  : True"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Direct  : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Splice  : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created  : $harini"
	echo -e "Expired  : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# DELETE VLESS XTLS
function menu9() {
	clear
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Delete User Xray Vless Tcp Xtls"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
	uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	sed -i "/^#vxtls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
	systemctl restart xray
	clear
	echo " Xray Vless Tcp Xtls Account Deleted Successfully"
	echo " =========================="
	echo " Client Name : $user"
	echo " Expired On  : $exp"
	echo " =========================="
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# RENEW VLESS XTLS
function menu10() {
	clear
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User Xray Vless Tcp Xtls"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	read -p "Expired (days): " masaaktif
	harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
	uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	now=$(date +%Y-%m-%d)
	d1=$(date -d "$exp" +%s)
	d2=$(date -d "$now" +%s)
	exp2=$(((d1 - d2) / 86400))
	exp3=$(($exp2 + $masaaktif))
	exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
	sed -i "s/#vxtls $user $exp $harini $uuid/#vxtls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
	service cron restart
	clear
	echo ""
	echo " Xray Vless Tcp Xtls Account Was Successfully Renewed"
	echo " =========================="
	echo " Client Name : $user"
	echo " Expired On  : $exp4"
	echo " =========================="
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
#SHOW VLESS XTLS
function menu11() {
	clear
	xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2 | sed 's/ //g')"
	NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS XTLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
	vlesslink1="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#${user}"
	vlesslink2="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com#${user}"
	clear
	echo -e ""
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "\e[$back_text     \e[30m[\e[$box XRAY VLESS XTLS\e[30m ]\e[1m         \e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Remarks          : ${user}"
	echo -e "Domain           : ${domain}"
	echo -e "Ip/Host          : ${MYIP}"
	echo -e "Port Xtls        : $xtls"
	echo -e "User ID          : ${uuid}"
	echo -e "Encryption       : None"
	echo -e "Network          : TCP"
	echo -e "Flow             : Direct & Splice"
	echo -e "AllowInsecure    : True"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Pantang Larang $creditt Shop"
	echo -e "‼️Aktiviti Berikut Adalah Dilarang(ID akan di ban tanpa notis & tiada refund)"
	echo -e "\e[31m❌ Torrent (p2p, streaming p2p)"
	echo -e "\e[31m❌ PS4"
	echo -e "\e[31m❌ Porn"
	echo -e "\e[31m❌ Spam Bug"
	echo -e "\e[31m❌ Ddos Server"
	echo -e "\e[31m❌ Mining Bitcoins"
	echo -e "\e[31m❌ Abuse Usage"
	echo -e "\e[31m❌ Multi-Login ID"
	echo -e "\e[31m❌ Sharing Premium Config\e[m"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Direct : ${vlesslink1}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Link Xtls Splice : ${vlesslink2}"
	echo -e "\e[$line═════════════════════════════════\e[m"
	echo -e "Created    : $harini"
	echo -e "Expired    : $exp"
	echo -e "Script By $creditt"
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# CEK USER LOGIN VLESS XTLS
function menu12() {
	clear
	echo -n >/tmp/other.txt
	data=($(cat /usr/local/etc/xray/config.json | grep '^#vxtls' | cut -d ' ' -f 2))
	echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
	echo -e "\\E[0;44;37m     ⇱ XRAY Vless Xtls User Login ⇲       \E[0m"
	echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
	for akun in "${data[@]}"; do
		if [[ -z "$akun" ]]; then
			akun="tidakada"
		fi
		echo -n >/tmp/ipxray.txt
		data2=($(netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq))
		for ip in "${data2[@]}"; do
			jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
			if [[ "$jum" = "$ip" ]]; then
				echo "$jum" >>/tmp/ipxray.txt
			else
				echo "$ip" >>/tmp/other.txt
			fi
			jum2=$(cat /tmp/ipxray.txt)
			sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
		done
		jum=$(cat /tmp/ipxray.txt)
		if [[ -z "$jum" ]]; then
			echo >/dev/null
		else
			jum2=$(cat /tmp/ipxray.txt | nl)
			echo "user : $akun"
			echo "$jum2"
			echo ""
			echo -e "\e[$line══════════════════════════════════════════\e[m"
		fi
		rm -rf /tmp/ipxray.txt
		rm -rf /tmp/other.txt
	done
	echo ""
	read -n 1 -s -r -p "Press any key to back on menu xray"
	xraay
}
# MENU XRAY VMESS & VLESS
clear
echo -e ""
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text    \e[30m[\e[$box PANEL XRAY VLESS WEBSOCKET TLS\e[30m ]\e[1m    \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•1)\e[m \e[$below Create Vless Websocket Account\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below Trial User Vless Websocket\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below Deleting Vless Websocket Account\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below Renew Vless Websocket Account\e[m"
echo -e "    \e[$number (•5)\e[m \e[$below Show Config Vless Account\e[m"
echo -e "    \e[$number (•6)\e[m \e[$below Check User Login Vless\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total1} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[30m[\e[$box XRAY VLESS TCP XTLS(Direct & Splice)\e[30m ]\e[1m \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "    \e[$number (•7)\e[m \e[$below Create Xray VLess Xtls Account\e[m"
echo -e "    \e[$number (•8)\e[m \e[$below Trial User Vless Xtls\e[m"
echo -e "    \e[$number (•9)\e[m \e[$below Deleting Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (10)\e[m \e[$below Renew Xray Vless Xtls Account\e[m"
echo -e "    \e[$number (11)\e[m \e[$below Show Config Vless Xtls Account\e[m"
echo -e "    \e[$number (12)\e[m \e[$below Check User Login Vless Xtls\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text  \e[$box x)   MENU                              \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "        Please Input Number  [1-12 or x] :  " num
echo -e ""
if [[ "$num" = "1" ]]; then
	menu1
elif [[ "$num" = "2" ]]; then
	menu2
elif [[ "$num" = "3" ]]; then
	menu3
elif [[ "$num" = "4" ]]; then
	menu4
elif [[ "$num" = "5" ]]; then
	menu5
elif [[ "$num" = "6" ]]; then
	menu6
elif [[ "$num" = "7" ]]; then
	menu7
elif [[ "$num" = "8" ]]; then
	menu8
elif [[ "$num" = "9" ]]; then
	menu9
elif [[ "$num" = "10" ]]; then
	menu10
elif [[ "$num" = "11" ]]; then
	menu11
elif [[ "$num" = "12" ]]; then
	menu12
elif [[ "$num" = "x" ]]; then
	menu
else
	clear
	echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
	sleep 1
	xraay
