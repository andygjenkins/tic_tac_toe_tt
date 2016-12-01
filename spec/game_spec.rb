require 'spec_helper'

describe Game do
  subject(:game) { described_class.new() }
  let(:board) { described_class::BOARD }

  describe "initialize" do
    it "has a board when initialized" do
      expect(game.board).to eq board
    end

    it "defaults to player one when initialized" do
      expect(game.current_player). to eq :X
    end
  end

  describe "#take_turn" do
    before :each do
      game.take_turn(0,0)
    end

    it "allows a player to claim a field" do
      expect(game.board[0][0]).not_to be_empty
    end

    it "switches player turns" do
      expect(game.current_player). to eq :O
    end
  end
end
