#!/bin/bash
#Autoscript-Lite By khaiVPN91

#----- Auto Remove Vmess
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
rm -f /usr/local/etc/xray/$user-tls.json /usr/local/etc/xray/$user-none.json
rm -f /home/vps/public_html/$user-VMESS-TLS.yaml /home/vps/public_html/$user-VMESS-NTLS.yaml /home/vps/public_html/$user-VMMAXIS.yaml /home/vps/public_html/$user-VMDIGI.yaml
systemctl restart xray.service
systemctl restart xray@none.service
fi
done

#----- Auto Remove Vless
data=( `cat /usr/local/etc/xray/vless.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vnone.json
rm -f /home/vps/public_html/$user-VLESS-TLS.yaml /home/vps/public_html/$user-VLESS-NTLS.yaml /home/vps/public_html/$user-VLMAXIS.yaml /home/vps/public_html/$user-VLDIGI.yaml
systemctl restart xray@vless.service
systemctl restart xray@vnone.service
fi
done

#----- Auto Remove Trojan
data=( `cat /usr/local/etc/xray/trojanws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trojanws.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trnone.json
rm -f /home/vps/public_html/$user-TROJAN-TLS.yaml /home/vps/public_html/$user-TROJAN-NTLS.yaml /home/vps/public_html/$user-TRMAXIS.yaml /home/vps/public_html/$user-TRDIGI.yaml
systemctl restart xray@trojanws.service
systemctl restart xray@trnone.service
fi
done

#----- Auto Remove Trojan TCP
data=( `cat /usr/local/etc/xray/trojan.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/trojan.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trojan.json
rm -f /home/vps/public_html/$user-TROJAN-TCP.yaml
systemctl restart xray@trojan.service
fi
done

#----- Auto Remove Vless TCP XTLS
data=( `cat /usr/local/etc/xray/xtls.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/xtls.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/xtls.json
rm -f /home/vps/public_html/$user-VLESS-DIRECT.yaml /home/vps/public_html/$user-VLESS-DIRECT443.yaml /home/vps/public_html/$user-VLESS-SPLICE.yaml /home/vps/public_html/$user-VLESS-SPLICE443.yaml
systemctl restart xray@xtls.service
fi
done

#----- Auto Remove Trojan-Go
data=( `cat /usr/local/etc/xray/akauntrgo.conf | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/akauntrgo.conf" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/akauntrgo.conf
sed -i '/^,"'"$user"'"$/d' /usr/local/etc/xray/trgo.json
rm -f /home/vps/public_html/$user-TRGO-STD.yaml /home/vps/public_html/$user-TRGO-WS.yaml /home/vps/public_html/$user-TRGODIGI.yaml
systemctl restart trojan-go.service
fi
done
