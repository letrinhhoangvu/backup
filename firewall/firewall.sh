#!/bin/bash
IF=`/sbin/route | grep -i 'default' | awk '{print $8}'`
IP=`/sbin/ifconfig $IF |  grep "inet " | awk '{print $2}'`
IPT="iptables"

$IPT -F
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

$IPT -A OUTPUT -o $IF -s $IP -j ACCEPT

$IPT -A INPUT -i $IF -d $IP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A INPUT -i $IF -d $IP -m limit --limit 1/s -j LOG --log-level 5 --log-prefix "BAD_INPUT: "
$IPT -A INPUT -i $IF -d $IP -j DROP


$IPT -A OUTPUT -o $IF -d $IP -m limit --limit 1/s -j LOG --log-level 5 --log-prefix "BAD_OUTPUT: "
$IPT -A OUTPUT -o $IF -d $IP -j DROP

$IPT -A FORWARD -i $IF -d $IP -m limit --limit 1/s -j LOG --log-level 5 --log-prefix "BAD_FORWARD: "
$IPT -A FORWARD -i $IF -d $IP -j DROP


