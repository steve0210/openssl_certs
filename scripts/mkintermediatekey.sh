#!/bin/sh
ca=intermediate
key=intermediate/private/$ca.key.pem
csr=intermediate/csr/$ca.csr.pem

echo "creating $ca key ..."
openssl genrsa -aes256 -out $key 4096
chmod 400 $key
echo "creating $ca csr ..."
openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
	  
