#!/bin/sh

[ -n "$1" ] && encrypt="-aes256"
int=intermediate
key=intermediate/private/$int.key.pem
csr=intermediate/csr/$int.csr.pem

echo "creating $int key ..."
openssl genrsa $encrypt -out $key 4096
chmod 400 $key
echo "creating $int csr ..."
openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
	  
