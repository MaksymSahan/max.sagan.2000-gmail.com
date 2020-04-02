#!/bin/bash

HOSTNAME=hostname
wget "https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb"

sudo dpkg -i zabbix-release_4.0-2+bionic_all.deb
sudo apt update
sudo apt-get install -y zabbix-agent

sudo sed -i 's/Server=127.0.0.1/Server=192.168.122.189/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/ServerActive=127.0.0.1/ServerActive=192.168.122.189/' /etc/zabbix/zabbix_agentd.conf
sudo sed -i "s/Hostname=Zabbix\ server/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf

sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent