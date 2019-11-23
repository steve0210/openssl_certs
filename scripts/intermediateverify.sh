#!/bin/sh

ca=ca
cert=intermediate/certs/intermediate.cert.pem
root=certs/$ca.cert.pem

openssl x509 -noout -text -in $cert
openssl verify -CAfile $root $cert
cat intermediate/index.txt

