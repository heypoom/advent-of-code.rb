LINES = File.read('./input').lines.map(&:strip)
COLS = LINES[0].size

def from_column(lines, col)
  lines.map { |line| line[col].to_i }
end

def get_common_bits(bits, is_oxygen)
  zeros = bits.count(0)
  ones = bits.count(1)

  # Oxygen generator rating
  if is_oxygen
    return 1 if zeros == ones

    # most common
    return zeros > ones ? 0 : 1
  end

  # CO2 scrubber rating
  return 0 if zeros == ones

  # least common
  zeros < ones ? 0 : 1
end

# move horizantally across each bits...
def parse(is_oxygen)
  lines = LINES.clone

  (0..COLS - 1).each do |col|
    puts "col #{col}"

    # bits at the n-th column.
    bits = from_column(lines, col)
    puts "bits #{bits}"

    # number selected by the bit criteria
    common = get_common_bits(bits, is_oxygen)
    puts "common #{common}"

    # keep only numbers selected by the criteria.
    lines = lines.filter.with_index { |_line, i| bits[i] == common }
    puts "lines #{lines}"

    return lines[0].to_i(2) if lines.size == 1

    puts 'continue'
  end
end

o2 = parse(true)
co2 = parse(false)

puts "o2 = #{o2}, co2 = #{co2}"
puts o2 * co2
