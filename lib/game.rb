require_relative 'player'

class Game

  attr_reader :board, :current_player

  def initialize
    @player_one = Player.new(symbol: :X)
    @player_two = Player.new(symbol: :O)
    @board = [["", "", "",],["", "", "",],["", "", ""]]
    @current_player = @player_one
    # @print_board = puts "#{@board[0]}\n#{@board[1]}\n#{@board[2]}"
    @champ = nil
  end


  def take_turn(x,y)
    if @champ != nil
      raise "game has been won by #{@champ.to_s}"
    end
    if !@board[x][y].empty?
      raise "field is claimed"
    end
    @board[x][y] = @current_player.symbol
    switch_player
    winner?
    post_winner
  end

  private

  def post_winner
    @champ ? "We have a winner!" : ""
  end

  def switch_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def game_rules
    row_one = board[0]
    row_two = board[1]
    row_three = board[2]
    column_1 = [ board[0][0], board[1][0], board[2][0] ]
    column_2 = [ board[0][1], board[1][1], board[2][1] ]
    column_3 = [ board[0][2], board[1][2], board[2][2] ]
    diagonal_1 = [ board[0][0], board[1][1], board[2][2] ]
    diagonal_2 = [ board[0][2], board[1][1], board[2][0] ]
    winning_routes = [row_one, row_two, row_three, column_1, column_2, column_3, diagonal_1, diagonal_2]
    iterate_rules(winning_routes)
  end

  def winner?
    game_rules
  end

  def iterate_rules(winning_routes)
    sym1 = @player_one.symbol
    sym2 = @player_two.symbol
    winning_routes.each do |i|
      if i == [sym1, sym1, sym1]
        @champ = @player_one
      elsif i == [sym2, sym2, sym2]
        @champ = @player_two
      end
    end
  end
end
