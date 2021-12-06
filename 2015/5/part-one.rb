def has_twice(str)
  str.chars.reduce do |a, b|
    return true if a[-1] == b
    a + b
  end

  return false
end

def is_nice(str)
  str.scan(/[aeiou]/).count >= 3 and
  has_twice(str) and
  not %w(ab cd pq xy).any? { |n| str.include? n }
end

# answer: 236
puts File.read("input").lines.map(&method(:is_nice)).count(true)

