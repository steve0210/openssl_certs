#!/bin/sh
cert=certs/ca.cert.pem

openssl x509 -noout -text -in $cert

