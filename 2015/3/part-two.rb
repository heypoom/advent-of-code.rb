#!/usr/bin/env ruby

# (col, row)
MOVES = {
  # North
  "^" => [0, -1],

  # South
  "v" => [0, 1],

  # East
  ">" => [1, 0],

  # West
  "<" => [-1, 0]
}

$grid = Array.new(150) { Array.new(150).fill(false) }
s_col, s_row = 100, 100

$coords = [[s_col, s_row], [s_col, s_row]]

$grid[s_row][s_col] = true
$lucky = 1

def move(char, player)
  m = MOVES[char]
  return unless m

  pos = $coords[player]
  m_col, m_row = m

  pos[0] += m_col
  pos[1] += m_row
  col, row = pos

  return if $grid[row][col]
  $grid[row][col] = true

  $lucky += 1
end

File.read("input").strip.chars.each_slice(2).to_a.each do |santa, robo|
  move(santa, 0)
  move(robo, 1)
end

puts $lucky

# answer: 2341

