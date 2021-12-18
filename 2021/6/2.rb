class Solution
  def initialize
    @fish_to_spawn = 0
    @days = 256
    @fishes = File.read('./test').split(',').map(&:to_i)
  end

  def solve
    (1..@days).each do
      cycle
    end

    p @fishes.size
  end

  def cycle
    @fishes = @fishes.map do |fish|
      next 6 if fish.zero?

      fish - 1
    end

    to_spawn = @fishes.count(0)

    (1..@fish_to_spawn).each do
      @fishes.push(8)
    end

    @fish_to_spawn = to_spawn
  end
end

Solution.new.solve
