require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  attr_reader :board, :cursor, :notifications

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
  end

  def reset!
    @notifications.delete(:error)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def set_check!
    @notifications[:check] = "Check!"
  end

  def render
    system("clear")
    puts "Use Arrow keys to move and enter/space to select."
    build_grid.each { |row| puts row.join }

    @notifications.each do |key, val|
      puts "#{val}"
    end
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_green
    elsif [i, j] == cursor.cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end
end

if __FILE__ == $PROGRAM_NAME
  display = Display.new
  display.render
end
