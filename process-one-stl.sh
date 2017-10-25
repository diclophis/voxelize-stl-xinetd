#!/bin/sh

set -e
set -x

read OUT

/home/minecraft/voxelizer/build/bin/voxelizer $1 8 $OUT $OUT.vox

export MAVENCRAFT_SERVER=localhost
export MAVENCRAFT_PORT=25566

/home/minecraft/voxelizer/build/test/testVox $OUT.vox | ruby /home/minecraft/voxelize-stl-xinetd/main.rb $1 $2 $3 $4
