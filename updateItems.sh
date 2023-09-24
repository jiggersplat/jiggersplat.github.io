#!/bin/sh

#cd "$(dirname "$0")"; 

while true
do
#  if ! diff -q Items.data ~/Library/Caches/com.apple.findmy.fmipcore/Items.data &>/dev/null; then
  if cmp --silent -- "~/Library/Caches/com.apple.findmy.fmipcore/Items.data" 
"Items.data"; then
    echo "getting latest changes..."
    git pull
    echo "copying Items.data..."
    cp ~/Library/Caches/com.apple.findmy.fmipcore/Items.data .
    echo "committing changes..."
    git add --all
    git commit -m "update locations"
    echo "pushing to github..."
    git push
    echo "done."
  else
    echo "no updates detected"
  fi
  sleep 60 
done
