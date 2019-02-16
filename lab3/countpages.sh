#!/bin/bash

names=$(cat $1 | sed s/,//)

for name in $names; do
	index=$(curl -f -s https://personal.soton.ac.uk/$name/index.html)
	
	if [ $? -eq 0 ]; then
		chars=$(echo $index | wc -m)
		echo "$name - $chars characters"
	fi
done | sort -n -r -k 3,3
