#!/bin/sh

int=${1-intermediate}
server=$2
ca=$(basename $(pwd))

if [ -n "$server" ]; then
  echo "creating root.crt ..."
  cp certs/$ca.cert.pem out/client/root.crt
else
  echo "creating root.crt, postgresql.crt, and postgresql.key"
  cp certs/$ca.cert.pem out/server/root.crt
  cp intermediate/certs/$int.cert.pem out/client/postgresql.crt
  cp intermediate/private/$int.key.pem out/client/postgresql.key
fi
