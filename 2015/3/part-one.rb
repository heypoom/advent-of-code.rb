#!/usr/bin/env ruby

# (col, row)
moves = {
  # North
  "^" => [0, -1],

  # South
  "v" => [0, 1],

  # East
  ">" => [1, 0],

  # West
  "<" => [-1, 0]
}

s = File.read("input")

grid = Array.new(150) { Array.new(150).fill(false) }
col, row = 100, 100

grid[col][row] = true
lucky = 1

s.chars.each do |char|
  next unless moves[char]

  m_col, m_row = moves[char]
  col, row = m_col + col, m_row + row

  next if grid[row][col]
  grid[row][col] = true

  lucky += 1
end

puts lucky

# answer: 2081
