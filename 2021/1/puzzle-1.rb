l = File.read('./day-1-input').lines.map(&:to_i)

prev = 100_000
count = 0

l.each do |i|
  count += 1 if i > prev
  prev = i
end

puts count
