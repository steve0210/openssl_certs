#!/bin/sh

for d in $(find . -maxdepth 1 -type d -name 'ca*'); do 
  ./scripts/tar.sh $(basename $d)
done
