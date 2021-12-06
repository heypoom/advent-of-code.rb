input = File.read('./input').split("\n\n")

game_draws, *boards = input
game_draws = game_draws.split(',').map(&:to_i)
boards = boards.map { |board| board.lines.map(&:split).map { |l| l.map(&:to_i) } }

# def p_board(board, j = 2)
#   board.map { |line| line.map { |n| n.to_s.rjust(j, ' ') }.join(' ') }.join("\n")
# end

def mark_board(board, draws)
  board.map do |row|
    row.map { |col| draws.include? col }
  end
end

def vertical_winning?(board, col)
  (0..board.size - 1).all? do |row|
    board[row][col] == true
  end
end

def board_winning?(board)
  size = board.size - 1

  (0..size).each do |n|
    # Check for horizontal wins.
    # n is row
    return true if board[n].all? true

    # Check for vertical wins.
    # n is column
    return true if vertical_winning?(board, i)
  end

  false
end

def get_unmarked_sum(board, marked)
  score = 0

  board.each.with_index do |row, r|
    row.each.with_index do |col, c|
      score += col unless marked[r][c]
    end
  end

  score
end

def solve(boards, game_draws)
  round = 0
  board_wins = []

  loop do
    round_draws = game_draws[0, round]

    boards.each.with_index do |board, board_id|
      next if board_wins[board_id]

      marked = mark_board(board, round_draws)
      winning = board_winning? marked

      next unless winning

      board_wins[board_id] = true if winning
      win_count = board_wins.count(true)

      unmarked_sum = get_unmarked_sum(board, marked)
      score = unmarked_sum * (round_draws.last or 0)

      return score if win_count == boards.size
    end

    round += 1
  end
end

puts solve(boards, game_draws)
