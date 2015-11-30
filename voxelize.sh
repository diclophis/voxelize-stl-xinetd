#!/bin/sh

./voxelizer 250 8 $1 $1.vox
./testVox $1.vox > $1.dat
