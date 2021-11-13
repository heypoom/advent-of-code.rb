#!/usr/bin/env ruby

puts File.read("input-2").lines
  .map(&:strip)
  .map { |s| s.split("x").map(&:to_i) }
  .map { |l, w, h| (2*l*w + 2*w*h + 2*h*l) + [l, w, h].min(2).reduce(:*) }
  .sum

