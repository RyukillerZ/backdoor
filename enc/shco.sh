#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -e "${green}ENCRYPTION IN PROGRESS${NC}"
sleep 2
cd shc
ohgini=$(ls -1)
shcku() {
	shc -r -f $sayang -o /root/shc/$sayang
	rm -rf $sayang.x.c
}
for sayang in $ohgini; do
	shcku
done
echo -e "${green}ENCRYTION FILE COMPLETE..CHECK SAME FILE AT SHC FOLDER${NC}"
sleep 2
cd
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
enc
