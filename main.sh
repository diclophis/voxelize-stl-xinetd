#!/bin/bash

X=$(seq -2 1 2)
Y=$(seq -2 1 2)
TMP=/tmp

while true
do

for i in $X
do
  for j in $Y
  do
    r=0
    s=0
    k=$(echo $i '*' 32 + $r | bc)
    j=$(echo $j '*' 32 + $s | bc)
    read stl
    echo "/home/mavencraft/voxelizer/build/bin/voxelizer 254 4 $TMP/$stl $TMP/$stl.vox && rm $TMP/$stl && (/home/mavencraft/voxelizer/build/test/testVox $TMP/$stl.vox | ruby /home/mavencraft/voxelize-stl-xinetd/main.rb $k $j) && rm $TMP/$stl.vox"
  done
done

done
