#!/bin/sh
# A shell script written to automate the CTT Masternode Setup Process

Green=$(echo '\033[00;32m')
Cyan=$(echo '\033[00;36m')
RED=$(echo '\033[00;31m')
YELLOW=$(echo  '\033[00;33m')

echo "${Green}Im Starting to update!"
	apt update

echo "${Green}I've Finished updating! Now I need to upgrade."
	apt upgrade -y

echo "${Green}I've finished upgrading! Now I need to install dependencies"
	sudo apt-get install nano unzip git -y

echo "${Green}I've finished installing dependencies! Now I'll make folders and download the wallet."
	wget https://github.com/CTTDeveloperTeam/CTTCoin/releases/download/v1.0/CryptoInvest-1.0.0-x86_64-pc-linux-gnu.zip
	unzip CryptoInvest-1.0.0-x86_64-pc-linux-gnu.zips
	chmod +x cryptoinvest*
	
	./cryptoinvestd -daemon
	sleep 5
	./cryptoinvest-cli stop
echo "${Green}I've finished making folders and downloading the wallet! Now I'll create your cryptoinvest.conf file."	
	cd /root/.cryptoinvest/
	touch /root/.cryptoinvest/cryptoinvest.conf
	touch /root/.cryptoinvest/masternode.conf
	echo "rpcallowip=127.0.0.1" >> /root/.cryptoinvest/cryptoinvest.conf
	sleep 5
	echo "${Green}Enter an RPC username (It doesn't matter really what it is, just try to make it secure)"
		read username
			echo "rpcuser=$username" >> /root/.cryptoinvest/cryptoinvest.conf

	echo "${Green}Enter an RPC password(It doesn't matter really what it is, just try to make it secure)"
		read password
			echo "rpcpassword=$password" >> /root/.cryptoinvest/cryptoinvest.conf
	
	echo "server=1" >> /root/.cryptoinvest/cryptoinvest.conf
	echo "listen=1" >> /root/.cryptoinvest/cryptoinvest.conf
	echo "staking=1" >> /root/.cryptoinvest/cryptoinvest.conf
	echo "port=57810" >> /root/.cryptoinvest/cryptoinvest.conf
	echo "masternode=1" >> /root/.cryptoinvest/cryptoinvest.conf
	
	echo "${Green}What is the Global IP of your VPS? I'll put this into your config file for you because I'm so nice."
		read VPSip
			echo "masternodeaddr=$VPSip:57810" >> /root/.cryptoinvest/cryptoinvest.conf
			echo "bind=$VPSip:57810" >> /root/.cryptoinvest/cryptoinvest.conf
			echo "externalip=$VPSip:57810" >> /root/.cryptoinvest/cryptoinvest.conf
	         
	echo "${Green}What is your masternode genkey? I'll put this into your config file."
		read genkey
			echo "masternodeprivkey=$genkey" >> /root/.cryptoinvest/cryptoinvest.conf

	
echo "${YELLOW}Okay, it looks like you are all set. Let's startup the daemon!"
	cd /root/

	./cryptoinvestd -daemon
