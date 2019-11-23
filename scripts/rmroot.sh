#!/bin/sh
dir=ca

echo "removing $dir ..."
[ -d "$dir" ] && rm -rf $dir
