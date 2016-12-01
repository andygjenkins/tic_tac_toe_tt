class Game

  attr_reader :board, :current_player

  # or BOARD = [ "", "", "", "", "", "", "", "", ""] ?
  # selecting a space might be easier with cli, but winning conditions difficult...

  BOARD = [["", "", "",],["", "", "",],["", "", ""]]

  def initialize
    @board = BOARD
    @current_player = :X
  end


  def take_turn(x,y)
    @board[x][y] = @current_player
    switch_player
  end



  private

  def switch_player
    @current_player == :X ? @current_player = :O : @current_player = :X
  end


end
