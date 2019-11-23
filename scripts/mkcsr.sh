#!/bin/sh
name=$1
[ -n "$2" ] && encrypt="-aes256"

if [ -z "$name" ]
then
  echo "no name"; exit
fi

key=intermediate/private/$name.key.pem
csr=intermediate/csr/$name.csr.pem

if [ ! -f $key ]
then
  echo "making key $key ..."
  openssl genrsa $encrypt -out $key 2048
  chmod 400 $key
fi

echo "making csr $csr ..."
openssl req -config intermediate/openssl.cnf \
  -key $key -new -sha256 -out $csr

