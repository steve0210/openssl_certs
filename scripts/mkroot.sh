#!/bin/sh
dir=${1-ca}

echo "creating $dir ..."
mkdir -p $dir/certs $dir/crl $dir/newcerts $dir/private
chmod 700 $dir/private
touch $dir/index.txt
echo 1000 > $dir/serial

