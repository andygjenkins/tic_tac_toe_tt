require 'spec_helper'

describe Player do
  subject(:player) { described_class.new(symbol: :X) }

  describe "#intialize" do
    it "should initialize with a symbol" do
      expect(player.symbol).to eq :X
    end
  end
end
