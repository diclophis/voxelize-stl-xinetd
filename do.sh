#!/bin/bash

#MAVENCRAFT_PORT=25567
#export MAVENCRAFT_PORT

MAVENCRAFT_SERVER=localhost
export MAVENCRAFT_SERVER

nc -k -l 0.0.0.0 1234 | bash main.sh | xargs -t -P8 -I{} bash -c '{}'
