#!/usr/bin/env ruby

require 'tempfile'
require "tmpdir"
require 'zlib'
require 'stringio'

p = nil
Dir::Tmpname.create('voxelize-stl-xinetd', "/home/minecraft/tmp") { |path| p = path + ".stl" }

f = File.new(p, "a+")

#read_from_stdin_out_from_me, feed_stdin_bytes_to_me = IO.pipe
zs = StringIO.new

t = 0

begin
  loop do
    i = STDIN.read_nonblock(1024 * 32)
    if (l = i.length) > 0
      t += l
      #$stdout.write(".")
      #feed_stdin_bytes_to_me.write(i)
      zs << i
    end
    ready,_,_ = IO.select([STDIN], nil, nil, 1.0)
    break unless ready.length == 1
  end
rescue IO::WaitReadable
  $stdout.write("r")
  retry
rescue EOFError
  $stdout.write("x")
end

#puts read_from_stdin_out_from_me.read.inspect
#puts read_from_stdin_out_from_me.eof?
#puts read_from_stdin_out_from_me.read_nonblock(t).inspect

#gzip = Zlib::Inflate.new(Zlib::MAX_WBITS)
##read_from_stdin_out_from_me.rewind
#
#zb = read_from_stdin_out_from_me.read_nonblock(t)
#puts zb.inspect
#f.write(gzip.inflate(zb))
#f.close
#zs = StringIO.new(read_from_stdin_out_from_me.read_nonblock(t))

zs.rewind
gzip = Zlib::GzipReader.new(zs)
f.write(gzip.read)
f.close

##Zlib::GzipReader.new(read_from_stdin_out_from_me)
#f.write(gzip.read)

#system("echo #{File.basename(p)} >> /tmp/voxelizer-pipe")
$stdout.write(p)
