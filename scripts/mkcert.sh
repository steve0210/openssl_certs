#!/bin/sh
name=$1
days=${2-375}

csr=intermediate/csr/$name.csr.pem
cert=intermediate/certs/$name.cert.pem

if [ -z "$name" ]
then    
  echo "no name"; exit
elif [ ! -f "$csr" ]
then
  echo "no csr $csr"; exit
fi

openssl ca -config intermediate/openssl.cnf \
  -extensions server_cert -days $days -notext -md sha256 \
  -in $csr -out $cert
chmod 444 $cert

cat intermediate/index.txt

