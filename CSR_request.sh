#!/bin/bash
#Purpose:CSR Generation script

FQDN=$1

if [ ! -d “$HOME/ssl-certs/$FQDN” ]; then
  mkdir -p “$HOME/ssl-certs/$FQDN”
else
  echo “A certificate folder for FQDN: $FQDN already exist”
  exit
fi

cd “$HOME/ssl-certs/$FQDN”

echo -e “\n\n #################### Generating Certificate Signing Request..######################\n”
openssl req -nodes -newkey rsa:2048 -keyout $FQDN.key -out $FQDN.csr -subj “/C=US/ST=California/L=San Jose/O=Adobe System Incorporated/OU=IT/CN=$FQDN”

echo -e “\n\n ################################################\n”

cat $FQDN.csr

echo -e “\n\n ##################################################\n”
