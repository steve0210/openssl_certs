#!/bin/sh

dir=${1-ca}

echo "removing $dir ..."
[ -d "$dir" ] && rm -rf $dir
