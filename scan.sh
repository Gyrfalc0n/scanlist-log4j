#!/bin/bash
filename="output.log"
line=$1
output=$(python3 log4j-scan.py -u $line --run-all-tests)
echo -e ">>>> $line \n" >> $filename
echo $output >> $filename
echo -e "\n\n" >> $filename
