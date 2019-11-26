#!/bin/sh

int=${1-intermediate}
if [ -n "$2" ]; then
  encrypt="-aes256"
  len=4096
else
  len=2048
fi

key=intermediate/private/$int.key.pem
csr=intermediate/csr/$int.csr.pem

echo "creating $int key ..."
openssl genrsa $encrypt -out $key $len
chmod 400 $key
echo "creating $int csr ..."
openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
	  
