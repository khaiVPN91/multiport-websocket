#!/bin/bash
#Autoscript-Lite By khaiVPN91
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
source /var/lib/premium-script/ipvps.conf
domain=$(cat /usr/local/etc/xray/domain)
clear
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop nginx
systemctl stop xray.service
systemctl stop xray@none.service
systemctl stop xray@vless.service
systemctl stop xray@vnone.service
systemctl stop xray@trojanws.service
systemctl stop xray@trnone.service
systemctl stop xray@xtls.service
systemctl stop xray@trojan.service
systemctl stop trojan-go.service
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
rm -r /root/.acme.sh
sleep 2
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --server https://api.buypass.com/acme/directory \
        --register-account  --accountemail khaiVPN91multiport@gmail.com
/root/.acme.sh/acme.sh --server https://api.buypass.com/acme/directory --issue -d $domain --standalone -k ec-256			   
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /usr/local/etc/xray/domain
systemctl restart $Cek
sleep 1
systemctl restart nginx
sleep 1
systemctl restart xray.service
sleep 1
systemctl restart xray@none.service
sleep 1
systemctl restart xray@vless.service
sleep 1
systemctl restart xray@vnone.service
sleep 1
systemctl restart xray@trojanws.service
sleep 1
systemctl restart xray@trnone.service
sleep 1
systemctl restart xray@xtls.service
sleep 1
systemctl restart xray@trojan.service
sleep 1
systemctl restart trojan-go.service
sleep 1
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
clear
neofetch
echo ""