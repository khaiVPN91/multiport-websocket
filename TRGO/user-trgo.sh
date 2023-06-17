#!/bin/bash
#Autoscript-Lite By khaiVPN91
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akauntrgo.conf")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;41;36m     Check Trojan GO WS Config     \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                echo ""
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;41;36m     Check Trojan GO WS Config     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/usr/local/etc/xray/akauntrgo.conf" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear
echo ""
read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " hst
bug_addr=${address}.
bug_addr2=${address}
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
bug=${hst}
bug2=bug.com
if [[ $hst == "" ]]; then
sni=$bug2
else
sni=$bug
fi

trgows="$(cat ~/log-install.txt | grep -w "TROJAN GO WS" | cut -d: -f2|sed 's/ //g')"
domain=$(cat /usr/local/etc/xray/domain)
user=$(grep -E "^### " "/usr/local/etc/xray/akauntrgo.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akauntrgo.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
trojanlink="trojan-go://${user}@${sts}${domain}:${trgows}?type=standard&sni=${sni}&encryption=none#TROJAN_GO_${user}"
trojanlinkws="trojan-go://${user}@${sts}${domain}:${trgows}?sni=${sni}&type=ws&host=${domain}&path=/trojangows&encryption=none#TROJAN_GO_${user}"
clear
echo -e "═════════════[TROJAN GO WS]═════════════"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port              : ${trgows}"
echo -e "Password          : ${user}"
echo -e "Security          : TLS"
echo -e "Encryption        : None"
echo -e "Network           : Standard & Websocket"
echo -e "Path              : /trojangows"
echo -e "════════════════════════════════════════"
echo -e "Link Trojan Go    : ${trojanlink}"
echo -e "════════════════════════════════════════"
echo -e "Link Trojan Go WS : ${trojanlinkws}"
echo -e "════════════════════════════════════════"
echo -e "YAML TROJAN GO    : http://${domain}:81/$user-TRGO-STD.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML TROJAN GO WS : http://${domain}:81/$user-TRGO-WS.yaml"
echo -e "════════════════════════════════════════"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "════════════════════════════════════════"
echo -e ""
echo -e "Autoscript By khaiVPN91"
echo -e ""