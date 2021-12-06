list = File.read('./day-1-input').lines.map(&:to_i)

sums = []

(0..(list.size - 3)).each do |i|
  sums.push(list[i, 3].sum)
end

prev = 100_000
count = 0

sums.each do |n|
  count += 1 if n > prev
  prev = n
end

puts count
