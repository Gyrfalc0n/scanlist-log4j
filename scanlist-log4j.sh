#!/bin/bash
filename="output.log"
start=`date +%s`
file=$1 #arg 1 : filename with list of url (must begin with http:// or https://)
lines=$(cat $file)
[ -e $filename ] && rm -- $filename
touch $filename
number=$(cat $file | wc -l)
echo -e "\nScanning $number address..."
for line in $lines
do
	bash scan.sh $line &

done
wait
end=`date +%s`
echo Execution time was `expr $end - $start` seconds.
result=$(cat result-thread.txt | grep "Targets does not seem to be vulnerable" | wc -l)
echo "$result targets does not seem to be vulnerable" 
if [[ $result < $number ]]
then
	echo -e "\e[31m$number - $result\e[0m targets seem to be VULNERABLE\n"
else
	echo -e "\e[32mNo targets seem to be vulnerable\e[0m\n"
fi
