#!/bin/bash

X=$(seq -256 64 256)
Y=$(seq -256 64 256)
TMP=/tmp

while true
do

for i in $X
do
  for j in $Y
  do
    r=$(echo $RANDOM % 96 | bc)
    s=$(echo $RANDOM % 96 | bc)
    k=$(echo $i '*' 16 + $r | bc)
    j=$(echo $j '*' 16 + $s | bc)
    read stl
    echo "/home/mavencraft/voxelizer/build/bin/voxelizer 254 4 $TMP/$stl $TMP/$stl.vox && rm $TMP/$stl && (/home/mavencraft/voxelizer/build/test/testVox $TMP/$stl.vox | ruby /home/mavencraft/voxelize-stl-xinetd/main.rb $k $j) && rm $TMP/$stl.vox"
  done
done

done
