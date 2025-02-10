require 'spec_helper'

RSpec.describe Hand do
  describe "#initialize" do
    let(:cards) { [Card.new(rank: "A", suit: :H), Card.new(rank: "K", suit: :S)] }

    it "sets the instance variable @cards" do
      hand = Hand.new(cards)
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#possible_hands" do
    let(:cards) do
      [
        Card.new(rank: "A", suit: :H),
        Card.new(rank: "A", suit: :S),
        Card.new(rank: "A", suit: :D),
        Card.new(rank: "K", suit: :H),
        Card.new(rank: "K", suit: :S)
      ]
    end
    let(:expected_hands) { [:full_house, :three_of_a_kind, :two_pair, :pair, :high_card]}

    it "returns all possible hands in order of highest to lowest" do
      hand = Hand.new(cards)
      expect(hand.possible_hands).to eq(expected_hands)
    end
  end
end
