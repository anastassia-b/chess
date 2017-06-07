module Slideable
  HORIZONTAL_DIRS = [[-1, 0], [0, -1], [0, 1], [1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def vertical_dirs
    VERTICAL_DIRS
  end

  def moves
    moves = []

    moves_dirs.each do |dx, dy|
      moves.concat(grow_unblock_moves_in_dir(dx, dy))
    end

    moves
  end

  private

  def move_dirs
    # raise NotImplementedError
  end

  def grow_unblock_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []
    loop do
      cur_x, cur_y = cur_x + dx, cur_y + dy
      pos = [cur_x, cur_y]

      break unless board.is_valid?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color
        break
      end
    end
    moves
  end

end
