require 'player'

class Game

  attr_reader :board, :current_player

  # or BOARD = [ "", "", "", "", "", "", "", "", ""] ?
  # selecting a space might be easier with cli, but winning conditions difficult...

  BOARD = [["", "", "",],["", "", "",],["", "", ""]]

  def initialize
    @player_one = Player.new(symbol: :X)
    @player_two = Player.new(symbol: :O)
    @board = BOARD
    @current_player = @player_one
  end


  def take_turn(x,y)
    if !@board[x][y].empty?
      raise "field is claimed"
    end
    @board[x][y] = @current_player.symbol
    switch_player
  end



  private

  def switch_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end


end
