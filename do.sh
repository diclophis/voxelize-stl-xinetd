#!/bin/bash

#MAVENCRAFT_PORT=25567
#export MAVENCRAFT_PORT

MAVENCRAFT_SERVER=localhost
export MAVENCRAFT_SERVER

rm /tmp/voxelizer-pipe
echo > /tmp/voxelizer-pipe
chmod 777 /tmp/voxelizer-pipe

tail --retry -f /tmp/voxelizer-pipe | bash /home/mavencraft/voxelize-stl-xinetd/main.sh | xargs -t -P8 -I{} bash -c '{}'
