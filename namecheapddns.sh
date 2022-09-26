#!/bin/sh

# Shell script to update namecheap.com dynamic dns
# for a domain to your external IP address


HOSTNAME1=ftp
HOSTNAME2=www
HOSTNAME3=@
DOMAIN=xxxxxxxx.com
PASSWORD=xxxxxxxxxxxxxxxxxxxxxxxxxxxx

# get current assigned IP
CURRENT_IP=$(curl -s ifconfig.io)
# get dns assigned IP
DYN_IP=$( dig +short ftp.xxxxxxxx.com | tail -n1 )
echo "The current IP address is:      $CURRENT_IP"
echo "The DNS assigned IP address is: $DYN_IP"

# check if dns has changed
if [ "$DYN_IP" != "$CURRENT_IP" ]; then
echo "Updating your DNS IP to: $CURRENT_IP"
curl "https://dynamicdns.park-your-domain.com/update?host=$HOSTNAME1&domain=$DOMAIN&password=$PASSWORD&ip=$CURRENT_IP"
curl "https://dynamicdns.park-your-domain.com/update?host=$HOSTNAME2&domain=$DOMAIN&password=$PASSWORD&ip=$CURRENT_IP"
curl "https://dynamicdns.park-your-domain.com/update?host=$HOSTNAME3&domain=$DOMAIN&password=$PASSWORD&ip=$CURRENT_IP"
else
echo No changes necessary.
fi


