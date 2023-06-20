#!/usr/bin/bash

echo "Domain,MX,SPF,DMARC"

printRecords () {
	echo -n "$1"

	mx=$(nslookup -type=mx $1 | grep "mail exchanger")
	spf=$(nslookup -type=txt $1 | grep -i "spf")
	dmarc=$(nslookup -type=txt _DMARC.$1 | grep -i "v=DMARC")

	if [ ${#mx} -gt 1 ]
	then
		echo -n ",+"
	else
		echo -n ",-"
	fi


	if [ ${#spf} -gt 1 ]
	then
		echo -n ",+"
	else
		echo -n ",-"
	fi


	if [ ${#dmarc} -gt 1 ]
	then
		echo -n ",+"
	else
		echo -n ",-"
	fi

	echo ""
}


while read d; do
  printRecords $d
done <$1


