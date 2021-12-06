input = File.read('./input').lines.map(&:strip)

x = 0
y = 0
aim = 0

input.each do |line|
  command, n_str = line.split
  n = n_str.to_i

  case command
  when 'forward'
    x += n
    y += (aim * n)
  when 'down'
    aim += n
  when 'up'
    aim -= n
  end
end

puts x * y
