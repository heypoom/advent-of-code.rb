def has_repeated(str)
  dict = {}

  (0..(str.size - 1)).step(2).each do |i|
    s = str.slice(i, 2)
    return true if dict[s]

    dict[s] = true
  end

  return false
end

def has_overlap(str)
  (0..(str.size - 4)).each do |i|
    return true if str.slice(i, 3).chars.uniq.size == 1
  end

  return false
end

def has_middle_repeat(str)
  (0..(str.size - 4)).each do |i|
    a, b, c = str.slice(i, 3).chars

    return true if a == c
  end

  return false
end

def is_nice(str)
  nice = has_repeated(str) && has_middle_repeat(str) && !has_overlap(str)

  puts "#{str} is nice!\n" if nice

  return nice
end

# answer: ???
# puts is_nice("suerykeptdsutidb")
puts File.read("input").lines.map(&:strip).map(&method(:is_nice)).count(true)


