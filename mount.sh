#!/bin/bash

#`` same with $()
varp=`grep "/mnt/T" /proc/mounts`
vard=$(grep "some_info" /proc/mounts)
mounts=0

if [ -n "$varp" -a ${#vard} -ne 0 ]
then
#echo "$varp"
echo "umount temp"
/usr/bin/sudo umount /mnt/T
mounts=$(( $mounts + 1 ))
#mounts=$(( ++mounts ))  //same effect with above
#unset vard  //delete variable
#unset varp
fi

varp=$(grep "/mnt/B2" /proc/mounts)
vard=$(grep "VISUALON" /proc/mounts)
if [ ${#varp} -ne 0 -a ${#vard} -ne 0 ]
then
#echo "$varp"
echo "umount build2"
/usr/bin/sudo umount /mnt/B2
mounts=$(( $mounts + 1 ))
#unset vard
#unset varp
fi

if [ $mounts -eq 0 ]
then
    echo "No path mounted"
else
    echo "mount paths: $mounts"
fi
