#!/bin/sh
int=intermediate
key=intermediate/private/$int.key.pem
csr=intermediate/csr/$int.csr.pem

echo "creating $int key ..."
openssl genrsa -aes256 -out $key 4096
chmod 400 $key
echo "creating $int csr ..."
openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
	  
