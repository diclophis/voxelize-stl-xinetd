#!/usr/bin/env ruby

$: << "/Users/mavenlink/workspace/mavencraft"
$: << "/Users/mavenlink/workspace/mavencraft/diclophis"
$: << "/home/minecraft/mavencraft"
$: << "/home/minecraft/mavencraft/diclophis"

require 'diclophis_world_painter'

#model_path = ARGV[0]
#system("test -e model.vox || ./voxelizer 250 8 #{model_path} model.vox") or exit 2
#system("test -e model.dat || ./testVox model.vox > model.dat") or exit 2

size = (ARGV[0].to_i)
oox = (ARGV[1].to_i) #-1024 + (256 * 22)
ooy = (ARGV[2].to_i) #(0.5 * size.to_f).to_i # 10/128 # 36/64 # 48/32
ooz = (ARGV[3].to_i) #-1024
type = (ARGV[4])

sleep rand*3.0
global_painter = DiclophisWorldPainter.new(true, oox, ooy, ooz)
puts "connected #{size} #{ARGV}"

global_painter.async do
  STDIN.readlines.each do |line|
    x,y,z = line.split(",")
    #puts x,y,z
    #t = (rand > 0.0001) ? global_painter.quartz_type : global_painter.glow_type
    #t = global_painter.type
    #t = global_painter.emerald_type
    #t = global_painter.quartz_type
    #t = global_painter.glass_type
    global_painter.place(x.to_i, y.to_i, z.to_i, type)
    #sleep 0.000333
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

puts global_painter.client.command_count
