#!/bin/sh

#cd "$(dirname "$0")"; 

while true
do
  if ! diff -q Items.data ~/Library/Caches/com.apple.findmy.fmipcore/Items.data 
&>/dev/null; then
    #git pull
    cp ~/Library/Caches/com.apple.findmy.fmipcore/Items.data .
    git add --all
    git commit -m "update locations"
    git push
  else
    echo "no updates detected"
  fi
  sleep 60 
done
