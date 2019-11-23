#!/bin/sh

file=ca.tar.gz
ldir=${1-ca}
cdir=$(pwd)
xdir=/mnt/c/Users/Steve/Documents

if [ ! -d "$ldir" ]
then
  echo "no $ldir directory"; exit
fi

echo "tar to $cdir/$file ..."
tar -zcf $file $ldir scripts

cd $xdir
[ -d "$ldir" ] && rm -fr $ldir

echo "extract to $xdir/$ldir ..."
tar -xf $cdir/$file $ldir
