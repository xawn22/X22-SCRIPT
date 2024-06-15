#!/bin/bash
clear
IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")
source /etc/mydb.conf
mkdir -p /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray/ &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/myscript/ /root/backup/myscript &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -r $date.zip backup > /dev/null 2>&1
curl -F chat_id="${id}" -F document=@"$date.zip" -F caption="
IP : $IP
Thank You" https://api.telegram.org/bot${token}/sendDocument &> /dev/null
cd /root
rm -rf /root/backup
rm -rf /root/$date.zip