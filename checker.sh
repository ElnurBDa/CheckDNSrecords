#!/usr/bin/bash


if [ $# -eq 2 ]
then

	if [ $2 == "v" ]
	then
		nslookup -type=mx $1 | grep "mail exchanger"
		nslookup -type=txt $1 | grep -i "spf"
		nslookup -type=txt _DMARC.$1 | grep -i "v=DMARC"
	fi
fi

mx=$(nslookup -type=mx $1 | grep "mail exchanger")
spf=$(nslookup -type=txt $1 | grep -i "spf")
dmarc=$(nslookup -type=txt _DMARC.$1 | grep -i "v=DMARC")

if [ ${#mx} -gt 1 ]
then
	echo "MX:    +"
else
	echo "MX:    -"
fi


if [ ${#spf} -gt 1 ]
then
	echo "SPF:   +"
else
	echo "SPF:   -"
fi


if [ ${#dmarc} -gt 1 ]
then
	echo "DMARC: +"
else
	echo "DMARC: -"
fi
