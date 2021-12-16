grid = File.read('./input').lines.map(&:strip).map do |line|
  line.split(' -> ').map { |n| n.split(',').map(&:to_i) }
end

out_grid = []

def p_grid(grid)
  out = grid.map do |col|
    next ' ' * grid.size unless col

    col.map { |n| n or ' ' }.join('')
  end

  puts out.join("\n")
end

def increment(grid, x, y)
  grid[y] = [] unless grid[y]
  grid[y][x] = 0 unless grid[y][x]

  grid[y][x] += 1
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
  end
end

p out_grid.flatten.select { |n| n && n >= 2 }.size
