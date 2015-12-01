#!/bin/bash

X=$(seq -256 64 256)
Y=$(seq -256 64 256)

for i in $X
do
  for j in $Y
  do
    r=$(echo $RANDOM % 100 | bc)
    s=$(echo $RANDOM % 100 | bc)
    k=$(echo $i '*' 8 + $r | bc)
    j=$(echo $j '*' 8 + $s | bc)
    read stl
    echo "/home/mavencraft/voxelizer/build/bin/voxelizer 300 8 $stl $stl.vox; /home/mavencraft/voxelizer/build/test/testVox $stl.vox | ruby /home/mavencraft/voxelize-stl-xinetd/main.rb $k $j"
    #echo ruby main.rb $k $j $stl
  done
done
