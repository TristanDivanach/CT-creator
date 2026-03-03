#!/bin/bash

template="/var/lib/vz/dump/TemplateCT.tar.zst"

read -p "From which ID do you want to create containers: " ID

read -p "How many containers do you want to create: " CT

read -p "How many CPUs: " CPU
read -p "What amount of RAM(in MB | default - 512): " RAM
RAM=${RAM:-512}
read -p "Which storage ? (storage ID | default - local): " ROM
ROM=${ROM:-local}

#Network
read -p "which Gateway: " GW


for (( i=1; i<=$CT; i++ ))
do
	IP=192.168.1.$ID/24
	echo "IP adress is $IP"
	pct create $ID "$template" \
		--cores $CPU \
		--memory $RAM \
		--storage "$ROM" \
		--net0 name=eth0,bridge=vmbr1,ip=$IP,gw=$GW
	echo "CT$ID created"
	pct start $ID
	echo "CT$ID started"
	((ID++))
done



