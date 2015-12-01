#!/usr/bin/env ruby

require 'tempfile'
require "tmpdir"

p = nil
Dir::Tmpname.create('voxelize-stl-xinetd') { |path| p = path + ".stl" }

f = File.new(p, "a+")

until STDIN.eof?
  i = (STDIN.read)
  f.write(i)
end

system("echo #{p} | nc localhost 1234")
puts p
