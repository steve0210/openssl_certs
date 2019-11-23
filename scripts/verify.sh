#!/bin/sh

name=$1
ca=$(basename $(pwd))
cert=intermediate/certs/$name.cert.pem
root=certs/$ca.cert.pem

if [ -z "$name" ]
then
  echo "no name"; exit
elif [ ! -f "$cert" ]
then
  echo "no cert $cert"; exit
fi

openssl x509 -noout -text -in $cert
openssl verify -CAfile $root $cert
