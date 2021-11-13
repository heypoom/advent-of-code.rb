#!/usr/bin/env ruby

# "1x1x10"

puts File.read("input-2").lines
  .map(&:strip)
  .map { |s| s.split("x").map(&:to_i) }
  .map { |l, w, h|
    a, b = [l, w, h].min(2)

    a + a + b + b + (l * w * h)
  }
  .sum




