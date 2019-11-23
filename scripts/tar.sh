#!/bin/sh

ldir=${1-ca}
file=$ldir.tar.gz
cdir=$(pwd)
xdir=/mnt/c/Users/Steve/Documents/root

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
