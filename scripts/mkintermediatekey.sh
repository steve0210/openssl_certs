#!/bin/sh

int=${1-intermediate}
[ -n "$2" ] && encrypt="-aes256"
key=intermediate/private/$int.key.pem
csr=intermediate/csr/$int.csr.pem

echo "creating $int key ..."
openssl genrsa $encrypt -out $key 4096
chmod 400 $key
echo "creating $int csr ..."
openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
	  
