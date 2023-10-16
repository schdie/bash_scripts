#!/bin/bash
# req: awk & xxd
# https://hashcat.net/wiki/doku.php?id=cracking_wpawpa2
echo -e "\033[1mVERSION 01: PMKID - VERSION 02: EAPOL\033[0m"
i=0
while IFS= read -r line; do
	# line number
	echo -en $(( ++i ))"."
	# $4=bssid $6=essid
	newline=`echo "$line" | awk -F "*" '{print "VERSION: "$2" BSSID: "$4" ESSID: "}'`
	newline2=`echo "$line" | awk -F "*" '{print $6}'`
	echo -ne "$newline"  && echo "$newline2" | xxd -r -p && echo
done <$1
