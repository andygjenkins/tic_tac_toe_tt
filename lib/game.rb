class Game

  attr_reader :board, :current_player

  # or BOARD = [ "", "", "", "", "", "", "", "", ""] ?
  # selecting a space might be easier with cli, but winning conditions difficult...

  BOARD = [["", "", "",],["", "", "",],["", "", ""]]

  def initialize
    @board = BOARD
    @current_player = :X
  end



end
