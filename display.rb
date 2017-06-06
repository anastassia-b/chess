require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  attr_reader :board, :cursor
  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def run
    loop do
      render
      @cursor.get_input
      system("clear")
    end
  end

  def render
    x,y = @cursor.cursor_pos
    puts '-' * 19
    (0..7).each do |i|
      print "| "
      (0..7).each do |j|
        if [i, j] == [x, y]
          print "😄 "#.colorize(:blue)
        else
          print "#{board[[i, j]].to_s} "
        end
      end
      print "|\n"
    end
    puts '-' * 19
  end

end

if __FILE__ == $PROGRAM_NAME
  display = Display.new
  display.run
end
