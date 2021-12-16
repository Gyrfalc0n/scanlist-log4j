#!/bin/bash
file=$1 #arg 1 : filename with list of url
lines=$(cat $file)
number=$(cat $file | wc -l)
count=1
for line in $lines
do
	if curl -s --head  --request GET $line | grep "200 OK" > /dev/null; then
  		echo -e "($count/$number) -> $line is \e[32mUP\e[0m"
	else
   		echo -e "($count/$number) -> $line is \e[31mDOWN\e[0m"
	fi
	count=$((count+1))
done
wait


