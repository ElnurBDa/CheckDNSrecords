# CheckDNSrecords
Checks MX, SPF and DMARC records with nslookup and outputs it in readable format. 

# How to use
checking one domain:
```
./checker.sh somedomain.com
```
checking it in verbose mode:
```
./checker.sh somedomain.com v
```
checking a list of domains:
```
./checkerForMany.sh domains.txt
```
outputting it to csv file:
```
./checkerForMany.sh domains.txt > table.csv
```

