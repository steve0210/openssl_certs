#!/bin/sh

name=$1
encrypt=$2

if [ -z "$name" ]
then
  echo "no name"; exit
fi
../scripts/mkcsr.sh $name $encrypt
../scripts/mkcert.sh $name
../scripts/mkchain.sh $name
../scripts/verify.sh $name
../scripts/cpoutserver.sh $name
