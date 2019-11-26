#!/bin/sh

name=${1-intermediate}
[ -z "$1" ] && encrypt=encrypt

../scripts/mkintermediatekey.sh $name $encrypt
../scripts/mkintermediatecert.sh $name $encrypt
../scripts/intermediateverify.sh $name
../scripts/cpoutroot.sh $name $encrypt
