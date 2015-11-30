#!/bin/sh

X=$(seq 64 128 2048)
Y=$(seq 64 128 2048)

for i in $X
do
  for j in $Y
  do
    r=$(echo $RANDOM % 80 | bc)
    s=$(echo $RANDOM % 80 | bc)
    k=$(echo $i '*' 8 + $r | bc)
    j=$(echo $j '*' 8 + $s | bc)
    read stl
    echo ruby main.rb $k $j $stl
  done
done


