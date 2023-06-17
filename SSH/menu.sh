#!/bin/bash
#Autoscript-Lite By khaiVPN91
P='\e[0;35m'
B='\033[0;36m'
N='\e[0m'
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
domain=$(cat /usr/local/etc/xray/domain)
user=$(cat /usr/local/etc/xray/user)

# // nginx status
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // xray status
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s icanhazip.com/ip )
if [ "$cekup" = "day" ]; then
echo -e " System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e " System Uptime   :  $uphours $upminutes"
fi
echo -e " VPN Core        :  XRAY-Core"
echo -e " Domain          :  $domain"
echo -e " IP VPS          :  $IPVPS"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "     [ XRAY-CORE${NC} : ${status_xray} ]   [ NGINX${NC} : ${status_nginx} ]"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 XRAY MENU                  \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•1 \033[0m]  XRAY Vmess WS Panel
 [\033[1;36m•2 \033[0m]  XRAY Vless WS Panel
 [\033[1;36m•3 \033[0m]  XRAY Trojan WS Panel
 [\033[1;36m•4 \033[0m]  XRAY Vless TCP XTLS Panel
 [\033[1;36m•5 \033[0m]  XRAY Trojan TCP Panel
 [\033[1;36m•6 \033[0m]  Trojan GO Panel"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                SYSTEM MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m•7 \033[0m]  Change Domain
 [\033[1;36m•8 \033[0m]  Renew Certificate XRAY
 [\033[1;36m•9 \033[0m]  Check VPN Status
 [\033[1;36m•10\033[0m]  Check VPN Port
 [\033[1;36m•11\033[0m]  Restart VPN Services
 [\033[1;36m•12\033[0m]  Speedtest VPS
 [\033[1;36m•13\033[0m]  Check RAM
 [\033[1;36m•14\033[0m]  DNS Changer
 [\033[1;36m•15\033[0m]  Netflix Checker
 [\033[1;36m•16\033[0m]  Backup
 [\033[1;36m•17\033[0m]  Restore
"
echo -e " \033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " Version       :\033[1;36m Multiport Websocket V1.0\e[0m"
echo -e " Autoscript By : khaiVPN91"
echo -e " Expiry Script : Lifetime"
echo -e " Client Name   : $user"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       menu-ws
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 2 ]]; then
       menu-vless
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 3 ]]; then
       menu-tr
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 4 ]]; then
       menu-xray
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 5 ]]; then
       menu-xtr
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 6 ]]; then
       menu-trgo
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 7 ]]; then
       add-host
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 8 ]]; then
       certxray
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 9 ]]; then
       status
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 10 ]]; then
       info
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 11 ]]; then
       restart
       menu
    elif [[ $x -eq 12 ]]; then
       clear
       speedtest
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 13 ]]; then
       clear
       ram
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 14 ]]; then
       dns
           echo ""
       menu
    elif [[ $x -eq 15 ]]; then
       clear
       nf
           echo ""
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 16 ]]; then
       backup
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 17 ]]; then
       restore
       read -n1 -r -p "Press any key to continue..."
       menu
    else
       menu
    fi
fi
