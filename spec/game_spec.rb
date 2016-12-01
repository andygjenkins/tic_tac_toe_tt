require 'spec_helper'

describe Game do
  subject(:game) { described_class.new() }

  describe "initialize" do
    it "has a board when initialized" do
      expect(game.board).to eq described_class::BOARD
    end

    it "defaults to player one when initialized" do
      expect(game.current_player). to eq :X
    end

  end




end
