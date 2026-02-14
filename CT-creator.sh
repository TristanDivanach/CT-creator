#!/bin/bash

template="/var/lib/vz/dump/Tempalte_Debian.tar.zst"

echo "From which ID do you want to create containers" read ID

echo "How many containers do you want to create ?" read CT

echo "How many CPUs" read CPU
echo "What amount of RAM(in MB | default - 512)" read RAM
echo "Which storage ? (storage ID | default - local" read ROM

#Network
echo "Which IP address use ? (IPV4/CIDR)" read IP
echo "which Gateway ?" read GW


echo "What password to you want to use" read PASSWD

for i in $CT 
	pct create $ID $template \
		--cores $CPU \
		--memory $RAM \
		--storage $ROM \
		--net $IP $Gw \
		--password $PASSWD
	echo "CT$ID created"
	pct start
	"CT$ID started"




