require "colorize"
class Piece
  attr_reader :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def to_s
    @symbol
  end

end

class NullPiece < Piece

end

class Queen < Piece

end

class Rook < Piece

end

class Bishop < Piece

end

class King < Piece

end

class Knight < Piece

end

class Pawn < Piece

end
