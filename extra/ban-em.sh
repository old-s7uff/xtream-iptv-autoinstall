#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
route add -net 149.202.206.0 netmask 255.255.255.0 reject
route add -net 123.103.255.0 netmask 255.255.255.0 reject
route add -net 62.210.244.0 netmask 255.255.255.0 reject
route add -net 185.73.0.0 netmask 255.255.0.0 reject
