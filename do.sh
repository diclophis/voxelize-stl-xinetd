#!/bin/sh

MAVENCRAFT_PORT=25567
export MAVENCRAFT_PORT

nc -k -l 0.0.0.0 1234 | sh main.sh | xargs -P2 -I{} bash -c '{}'
