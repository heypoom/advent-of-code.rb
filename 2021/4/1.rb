input = File.read('./input').split("\n\n")

game_draws, *boards = input
game_draws = game_draws.split(',').map(&:to_i)
boards = boards.map { |board| board.lines.map(&:split).map { |l| l.map(&:to_i) } }

def mark_board(board, draws)
  board.map do |row|
    row.map { |col| draws.include? col }
  end
end

def vertical_winning?(board, col)
  (0..board.size).all? { |row| board[row][col] == true }
end

def board_winning?(board)
  size = board.size - 1

  # Check for horizontal wins.
  (0..size).each do |i|
    # i is row
    return true if board[i].all? true

    # i is column
    return true if vertical_winning?(board, i)
  end

  false
end

def p_board(board, j = 2)
  puts board.map { |line| line.map { |n| n.to_s.rjust(j, ' ') }.join(' ') }.join("\n")
  puts
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

def get_winning_board_score(boards, game_draws)
  round = 0

  loop do
    p round
    round_draws = game_draws[0, round]

    boards.each do |board|
      marked = mark_board(board, round_draws)
      winning = board_winning? marked

      return get_unmarked_sum(board, marked) * round_draws.last if winning
    end

    round += 1
  end
end

score = get_winning_board_score(boards, game_draws)
p score
