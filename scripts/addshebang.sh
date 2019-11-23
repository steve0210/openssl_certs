#!/bin/sh
for f in ./scripts/*.sh
do 
  if ! head -1 $f | grep -q /bin/sh
  then 
    echo "adding shebang to $f"
    sed -i '1i#!/bin/sh' $f
  fi
  chmod +x $f
done
