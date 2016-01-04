#!/bin/sh

for I in $(seq 0 20 360)
do
  rm /tmp/ttt.stl
  sh -c "openscad -D 'msg=\"$1\"' -D 'ns=90' -D 'ew=90' -D 'sp=$I' -o /tmp/ttt.stl text_sphere.scad && cat /tmp/ttt.stl | gzip | nc localhost 33333"
done
