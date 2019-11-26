#!/bin/sh

int=${1-intermediate}
csr=intermediate/csr/$int.csr.pem
cert=intermediate/certs/$int.cert.pem
encrypt=$2

if [ -n "$encrypt" ]; then ext=v3_intermediate_ca; else ext=usr_cert; fi

echo "creating cert $cert"
openssl ca -config openssl.cnf -extensions $ext \
  -days 3650 -notext -md sha256 -in $csr -out $cert

chmod 444 $cert
