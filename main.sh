#!/bin/bash

X=$(seq -1 1 -1)
Y=$(seq -1 1 -1)
TMP=/tmp

while true
do

for i in $X
do
  for j in $Y
  do
    r=0 #$(echo $RANDOM % 4 | bc)
    s=0 #$(echo $RANDOM % 4 | bc)
    k=$(echo $i '*' 128 + $r | bc)
    j=$(echo $j '*' 128 + $s | bc)
    read stl
    echo "/home/mavencraft/voxelizer/build/bin/voxelizer 254 4 $TMP/$stl $TMP/$stl.vox && rm $TMP/$stl && (/home/mavencraft/voxelizer/build/test/testVox $TMP/$stl.vox | ruby /home/mavencraft/voxelize-stl-xinetd/main.rb $k $j) && rm $TMP/$stl.vox"
  done
done

done
