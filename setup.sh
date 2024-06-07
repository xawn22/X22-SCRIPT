#!/bin/bash
clear
########
apt update -y
apt upgrade -y
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://scstn22.stn-cloud.my.id/shell/null/x/file/zhsgh/executed.sh && chmod +x executed.sh && sed -i -e 's/\r$//' executed.sh && screen -S executed.sh ./executed.sh
rm -rf setup.sh
