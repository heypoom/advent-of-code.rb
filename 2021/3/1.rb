lines = File.read('./input').lines.map(&:strip)

bit_len = lines[0].size
len = lines.size

bits = (0..bit_len - 1).map do |bit_idx|
  r = lines.map { |line| line[bit_idx].to_i }

  r.count(0) > r.count(1) ? 0 : 1
end

gamma = bits.join.to_i(2)
epsilon = bits.map { |n| n.zero? ? 1 : 0 }.join.to_i(2)

power = gamma * epsilon
puts power
