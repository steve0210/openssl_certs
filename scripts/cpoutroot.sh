#!/bin/sh

int=${1-intermediate}
server=$2
ca=$(basename $(pwd))
clientd=out/client
serverd=out/server

if [ -n "$server" ]; then
  echo "creating root.crt ..."
  cp certs/$ca.cert.pem $clientd/root.crt
else
  crt=$clientd/postgresql.crt
  key=$clientd/postgresql.key
  pfx=$clientd/postgresql.pfx

  echo "creating root.crt, postgresql.crt, and postgresql.key, postgresql.pfx"
  cp certs/$ca.cert.pem $serverd/root.crt
  rm -f $clientd/*
  cp intermediate/certs/$int.cert.pem $crt
  cp intermediate/private/$int.key.pem $key
  cat $key $crt | openssl pkcs12 -export -out $pfx
fi
