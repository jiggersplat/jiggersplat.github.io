#!/bin/sh

if ! diff -q Items.data ~/Library/Caches/com.apple.findmy.fmipcore/Items.data 
&>/dev/null; then
	cp ~/Library/Caches/com.apple.findmy.fmipcore/Items.data .
	git add --all
	git commit -m "update locations"
	git push
fi
