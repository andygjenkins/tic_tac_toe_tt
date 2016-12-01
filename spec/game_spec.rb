require 'spec_helper'

describe Game do
  let(:player_one) { double(:player, symbol: :X) }
  let(:player_two) { double(:player, symbol: :O)}
  subject(:game) { described_class.new }


  describe "#initialize" do
    it "defaults to player one when initialized" do
      expect(game.current_player.symbol). to eq player_one.symbol
    end
  end

  describe "#take_turn" do
    context "empty field" do

      it "allows a player to claim a field" do
        game.take_turn(0,1)
        expect(game.board[0][1]).not_to be_empty
      end

      it "switches player turns" do
        game.take_turn(1,1)
        expect(game.current_player.symbol). to eq player_two.symbol
      end
    end

    context "taken field" do
      it "fails if you claim a taken field" do
        game.take_turn(0,0)
        expect{ game.take_turn(0,0) }.to raise_error "field is claimed"
      end

    end
  end
  context "winning a game" do
    it "game won if row is filled by one player" do
      game.take_turn(0,0)
      game.take_turn(0,1)
      game.take_turn(0,2)
      expect{ game.take_turn(0,0) }.to raise_error "field is claimed"
    end
  end
end
