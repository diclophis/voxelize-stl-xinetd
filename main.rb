#!/usr/bin/env ruby

$: << "/Users/mavenlink/workspace/mavencraft"
$: << "/Users/mavenlink/workspace/mavencraft/diclophis"

#require 'mc-schematic'
require 'diclophis_world_painter'

oox = -32
ooy = 35
ooz = -32
global_painter = DiclophisWorldPainter.new(oox, ooy, ooz)
puts "connected"

global_painter.async do
  File.readlines("/tmp/angelrrr.dat").each do |line|
    x,y,z = line.split(",")
    #puts x,y,z
    t = (rand > 0.0001) ? global_painter.quartz_type : global_painter.glow_type
    global_painter.place(x.to_i, y.to_i, z.to_i, t)
    $stdout.write(".")
  end
end

=begin
s = MCSchematic.new File.open('out-008.schematic')

#puts s.get_block(0, 0, 0).id
#exit

puts s.width, s.height, s.length
#exit


global_painter = DiclophisWorldPainter.new(oox, ooy, ooz)
puts "connected"

global_painter.async do
  s.width.times do |x|
    s.height.times do |y|
      s.length.times do |z|
        b = s.get_block(x,y,z)
        id = b.id
        #puts id.inspect
        global_painter.place(x, y, z, (id == 0) ? global_painter.air_type : global_painter.type)
        $stdout.write(".")
        #sleep 0.001
      end
    end
  end
end
=end
