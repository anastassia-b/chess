require_relative "piece.rb"
require "colorize"

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) { [] } }
    place_pieces
  end

  def place_pieces
    (2..5).each do |i|
      (0..7).each do |j|
        @grid[i][j] = NullPiece.new(:-)
      end
    end

    @grid[0][0] = Rook.new("\u2656")
    @grid[0][7] = Rook.new("\u2656")
    @grid[7][0] = Rook.new("\u265d")
    @grid[7][7] = Rook.new("\u265d")

    @grid[0][1] = Knight.new("\u2658")
    @grid[0][6] = Knight.new("\u2658")
    @grid[7][1] = Knight.new("\u265e")
    @grid[7][6] = Knight.new("\u265e")

    @grid[0][2] = Bishop.new("\u2657")
    @grid[0][5] = Bishop.new("\u2657")
    @grid[7][2] = Bishop.new("\u265d")
    @grid[7][5] = Bishop.new("\u265d")

    @grid[0][3] = King.new("\u2654")
    @grid[7][3] = King.new("\u265a")
    @grid[0][4] = Queen.new("\u2655")
    @grid[7][4] = Queen.new("\u265b")

    (0..7).each do |i|
      @grid[1][i] = Pawn.new("\u2659")
      @grid[6][i] = Pawn.new("\u265f")
    end
  end


  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    if board[start_pos].is_a?(NullPiece)
      raise "No piece at this spot. Enter a different spot."
    end
  end

  def is_valid?(pos)
    pos.all? {|el| el.between?(0,7)}
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  p board.render
end
