#!/bin/bash

X=$(seq -8 2 8)
Y=$(seq -8 2 8)
TMP=/mnt/a/tmp

while true
do

for i in $X
do
  for j in $Y
  do
    r=$(echo $RANDOM % 96 | bc)
    s=$(echo $RANDOM % 96 | bc)
    k=$(echo $i '*' 32 + $r | bc)
    j=$(echo $j '*' 32 + $s | bc)
    read stl
    SIZE=$(cat /var/tmp/size)
    echo "/home/mavencraft/voxelizer/build/bin/voxelizer $SIZE 8 $TMP/$stl $TMP/$stl.vox && rm $TMP/$stl && (/home/mavencraft/voxelizer/build/test/testVox $TMP/$stl.vox | ruby /home/mavencraft/voxelize-stl-xinetd/main.rb $k $j) && rm $TMP/$stl.vox"
  done
done

done
