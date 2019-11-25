#!/bin/bash
# Copyright (c) 2019 J9Fackque
# Command to run: sudo ./snmpscan.sh <communityString>

commstr=$1
# enumerate windows users
oid0="1.3.6.1.4.1.77.1.2.25"
# enumerate system names
oid1="1.3.6.1.2.1.1.5"
# enumerate Dell processors
oid2="1.3.6.1.4.1.674.10892.1.1100.30.1.23.1"
# enumerate cores
oid3="1.3.6.1.4.1.674.10892.1.1100.30.1.17"
# enumerate installed software
oid4="1.3.6.1.2.1.25.6.3.1.2"
# enumerate Dell drives
oid5="1.3.6.1.4.1.674.10893.1.20.130.4.1.2"
# enumerate Dell Drive model number
oid6="1.3.6.1.4.1.674.10893.1.20.130.4.1.6.2"
# enumerate Dell drive sizes in mb
oid7="1.3.6.1.4.1.674.10893.1.20.130.4.1.11"
# enumerate to confirm drive manufacturer is Dell
oid8="1.3.6.1.4.1.674.10893.1.20.130.4.1.3"

while read i; do
  # enumerate windows users, save output to winusers.txt
  echo $i >> winusers.txt
  snmpwalk -c $commstr -v1 $i $oid0 2>/dev/null >> winusers.txt
  sleep 2
  
  # enumerate system names, save output to sysnames.txt
  echo $i >> sysnames.txt
  snmpwalk -c $commstr -v1 $i $oid1 2>/dev/null >> sysnames.txt
  sleep 2
  
  # enumerate Dell processors, save output to processors.txt
  echo $i >> processors.txt
  snmpwalk -c $commstr -v1 $i $oid2 2>/dev/null >> processors.txt
  sleep 2
  
  # enumerate cores, save output to cores.txt
  echo $i >> cores.txt
  snmpwalk -c $commstr -v1 $i $oid3 2>/dev/null >> cores.txt
  sleep 2
  
  # enumerate installed software, save output to software.txt
  echo $i >> software.txt
  snmpwalk -c $commstr -v1 $i $oid4 2>/dev/null >> software.txt
  sleep 2
  
  # A deeper dive for Dell hard drive info...
  echo $i >> DellDriveinfo_vlan2.txt
  # enumerate system names
  snmpwalk -c $commstr -v1 $i $oid1 2>/dev/null >> DellDriveinfo_vlan2.txt
  sleep 2
  # enumerate Dell drives
  snmpwalk -c $commstr -v1 $i $oid5 2>/dev/null >> DellDriveinfo_vlan2.txt
  sleep 2
  # enumerate Dell Drive model number
  snmpwalk -c $commstr -v1 $i $oid6 2>/dev/null >> DellDriveinfo_vlan2.txt
  sleep 2
  # enumerate Dell drive sizes in mb
  snmpwalk -c $commstr -v1 $i $oid7 2>/dev/null >> DellDriveinfo_vlan2.txt
  sleep 2
  # enumerate to confirm drive manufacturer is Dell
  snmpwalk -c $commstr -v1 $i $oid8 2>/dev/null >> DellDriveinfo_vlan2.txt
  sleep 2
  
done < IP-list.txt
