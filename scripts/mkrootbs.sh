#!/bin/sh
dir=${1-ca}
encrypt=$2

if [ -d "$dir" -o "$(basename $(pwd))" = "$dir" ]
then
  echo "directory $dir exists"; exit
fi

./scripts/mkroot.sh $dir
cd $dir
../scripts/mkrootcnf.sh
../scripts/mkrootkey.sh 
../scripts/mkrootverify.sh
../scripts/mkintermediate.sh
../scripts/mkintermediatecnf.sh
../scripts/mkintermediatekey.sh $encrypt
../scripts/mkintermediatecert.sh
../scripts/intermediateverify.sh
../scripts/cpoutroot.sh $encrypt
