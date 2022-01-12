# scanlist-log4j
Simple bash script to scan multiples url for log4j vulnerability (CVE-2021-44228). This script uses the log4j scanner from **Fullhunt** : [https://github.com/fullhunt/log4j-scan](https://github.com/fullhunt/log4j-scan), and allow a better reading of results when testing multiples urls from a file.

![Image](https://github.com/Gyrfalc0n/scanlist-log4j/blob/main/Capture.PNG)

## Installation

First, install the Fullhunt `scan-log4j` repository with : 

```
git clone https://github.com/fullhunt/log4j-scan.git
cd log4j-scan
pip3 install -r requirements.txt
cd ..
```

Then install this script with : 

```
git clone https://github.com/Gyrfalc0n/scanlist-log4j.git
cd scanlist-log4j
mv *.sh ../log4j-scan
cd ../log4j-scan
```
Now you are ready to execute the script, but before that you need a file containing the urls you want to scan for log4j vulnerability. Make sure the file is readable and in the same directory of the scripts.

## Execution

Execute the script with : 

```
./scanlist-log4j.sh <url_list_file>
```
Each url to scan will be scanned simultaneously in a thread, resulting of a much faster execution time when scanning for multiples urls. Results are printed in terminal as the screen above. You always can check details in the `output.log` file.

## Check if host are up and running http/https

```
./check-domains.sh <url_list_file>
```

This script may be a bit slow, it uses `curl` to get response code from web page of urls and return if page is up.


## Modifications

`scanlist-log4j.sh` starts `scan.sh` with `scan-log4j` command for each line of file passed in first argument.

If you want to customize your command with `scan-log4j`, feel free to check the usage from the [repository](https://github.com/fullhunt/log4j-scan/blob/master/README.md#usage) and modify the `scan.sh` script which contains the command.
