grid = File.read('./input').lines.map(&:strip).map do |line|
  line.split(' -> ').map { |n| n.split(',').map(&:to_i) }
end

out_grid = []

def p_grid(grid, ch = '.')
  out = grid.map do |col|
    next ch * grid.size unless col

    col.map { |n| n or ch }.join('').ljust(grid.size, ch)
  end

  puts out.join("\n")
end

def increment(grid, x, y)
  # puts "> Drawing at #{x}, #{y}"

  grid[y] = [] unless grid[y]
  grid[y][x] = 0 unless grid[y][x]
  grid[y][x] += 1

  # p_grid grid, '•'
  # puts "\n---\n\n"
end

def draw_diagonal(grid, segment)
  point_a, point_b = segment.sort { |a, b| a.first <=> b.first }

  x1, y1 = point_a
  x2, y2 = point_b

  # puts "Diagonal: #{x1}, #{y1} to #{x2}, #{y2}"

  x = x1
  y = y1

  increment(grid, x, y)

  while x < x2
    x += 1

    # draw upwards or downwards diagonal.
    y += (y1 < y2 ? 1 : -1)

    increment(grid, x, y)
  end
end

grid.map do |segment|
  point_a, point_b = segment

  x1, y1 = point_a
  x2, y2 = point_b

  if x1 == x2
    # draw vertical lines
    a, b = [y1, y2].sort

    (a..b).each do |y|
      increment(out_grid, x1, y)
    end
  elsif y1 == y2
    # draw horizontal lines
    a, b = [x1, x2].sort

    (a..b).each do |x|
      increment(out_grid, x, y1)
    end
  else
    # draw diagonal lines
    draw_diagonal(out_grid, segment)
  end
end

# p_grid out_grid

p out_grid.flatten.select { |n| n && n >= 2 }.size
