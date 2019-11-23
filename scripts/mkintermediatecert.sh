#!/bin/sh
ca=intermediate
csr=intermediate/csr/$ca.csr.pem
cert=intermediate/certs/$ca.cert.pem

echo "creating cert $cert"
openssl ca -config openssl.cnf -extensions v3_intermediate_ca \
  -days 3650 -notext -md sha256 -in $csr -out $cert

chmod 444 $cert
