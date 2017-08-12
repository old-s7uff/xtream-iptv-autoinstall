#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -F
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Your Stream Port
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
#

iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A INPUT -j DROP

iptables -t nat -I OUTPUT --dest 149.202.206.51/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 123.103.255.80/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 62.210.244.112/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 185.73.239.0/28 -j DNAT --to-destination 127.0.0.1
apt-get update
apt-get install iptables-persistent
sudo invoke-rc.d iptables-persistent save

iptables -t nat -I OUTPUT --dest 149.202.206.51/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 123.103.255.80/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 62.210.244.112/28 -j DNAT --to-destination 127.0.0.1
iptables -t nat -I OUTPUT --dest 185.73.239.0/28 -j DNAT --to-destination 127.0.0.1
sudo invoke-rc.d iptables-persistent save
