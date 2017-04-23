#!/bin/bash

if [ $# -eq 0 ]
then
 echo "#####Please choose log file! #####"
 echo "#####Usage: $0 logfile #####"
 exit
else
 if [ -e $1 ]
 then
  inputsize=`ls -lh $1 | awk '{print $5}'`; ##get file size
  echo "Catching logs from $1(size:$inputsize)"
  inputfile=$1
 else
  echo "logfile $1 not exist"
  exit
 fi
fi

function process()
{
 content=$1;
 local inputfile=$2;
 outputfile="/Users/david/downloads/logs/${content}"; ##inside function, path must be absolute path
 #echo "inputfile:$inputfile, outputfile:$outputfile";
 echo "#=start to catch #$content# ==>";
 start=$(date +%s);
 grep -i "$content" "$inputfile" > "$outputfile";
 size=`ls -lh $outputfile | awk '{print $5}'`;
 end=$(date +%s);
 echo "#=finish catching #$content#, size:$size, cost:$((end - start))s <==";
}

processArray=("rndv" "rnda" "decv" "deca" "srcv" "srca")
num=${#processArray[*]}

for((i=0;i<$num;i++))
do
 echo "@@@@@@@_ $(($num-$i)) items left... _@@@@@@@"
 process "${processArray[$i]}" "$inputfile"
 echo ""
done
