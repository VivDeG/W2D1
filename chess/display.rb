require_relative "cursor"
require "colorize"

class Display
  attr_accessor :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    board.grid.each_with_index do |row, i|
      str = ""
      row.each_with_index do |col, j|
        if col.is_a? NullPiece
          el = "x" 
        else
          el = "O"
        end
        if [i, j] == cursor.cursor_pos
          puts el.colorize(:blue)
        end
        str << el
      end
      puts str
    end
    # cursor.get_input
  end

end