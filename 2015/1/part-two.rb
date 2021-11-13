#!/usr/bin/env ruby

content = File.read("input")
floor = 0

content.chars.each_with_index do |char, idx|
  floor += char == '(' ? 1 : -1

  if floor < 0
    puts idx
    exit
  end
end


