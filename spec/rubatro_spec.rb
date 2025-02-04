require 'spec_helper'

RSpec.describe Hand do
  describe "#initialize" do
    let(:cards) { [Card.new("A", "hearts"), Card.new("K", "spades")] }

    it "sets the instance variable @cards" do
      hand = Hand.new(cards)
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#possible_hands" do
    let(:cards) do
      [
        Card.new("A", "hearts"),
        Card.new("A", "spades"),
        Card.new("A", "diamonds"),
        Card.new("K", "hearts"),
        Card.new("K", "spades")
      ]
    end
    let(:expected_hands) { [:full_house, :three_of_a_kind, :two_pair, :pair, :high_card]}

    it "returns all possible hands in order of highest to lowest" do
      pending
      hand = Hand.new(cards)
      expect(hand.possible_hands).to eq(expected_hands)
    end
  end
end

RSpec.describe Card do
  let(:card) { Card.new("A", "hearts") }

  describe "#initialize" do
    it "sets the instance variable @value" do
      expect(card.value).to eq("A")
    end

    it "sets the instance variable @suit" do
      expect(card.suit).to eq("hearts")
    end
  end
end

RSpec.describe HandEvaluator do
  let(:hand) { Hand.new(cards) }
  subject { HandEvaluator.new(hand) }

  describe "#perform!" do
    context "royal flush" do
      let(:cards) do
        [
          Card.new("A", "hearts"),
          Card.new("K", "hearts"),
          Card.new("Q", "hearts"),
          Card.new("J", "hearts"),
          Card.new("10", "hearts")
        ]
      end

      it "returns :royal_flush" do
        expect(subject.perform!).to include(:royal_flush, :straight_flush, :flush, :straight)
      end
    end

    context "straight flush" do
      let(:cards) do
        [
          Card.new("A", "hearts"),
          Card.new("2", "hearts"),
          Card.new("3", "hearts"),
          Card.new("4", "hearts"),
          Card.new("5", "hearts")
        ]
      end

      it "returns :straight_flush" do
        expect(subject.perform!).to include(:straight_flush, :flush, :straight)
      end
    end

    context "four of a kind" do
    end

    context "full house" do
    end

    context "flush" do
      let(:cards) do
        [
          Card.new("2", "hearts"),
          Card.new("3", "hearts"),
          Card.new("8", "hearts"),
          Card.new("J", "hearts"),
          Card.new("A", "hearts")
        ]
      end

      it "returns :flush" do
        expect(subject.perform!).to include(:flush)
      end
    end

    context "straight" do
      context "straight with numbered cards" do
        let(:cards) do
          [
            Card.new("4", "clubs"),
            Card.new("3", "spades"),
            Card.new("6", "spades"),
            Card.new("5", "hearts"),
            Card.new("2", "hearts")
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace low" do
        let(:cards) do
          [
            Card.new("3", "hearts"),
            Card.new("A", "hearts"),
            Card.new("4", "diamonds"),
            Card.new("5", "hearts"),
            Card.new("2", "spades"),
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace high" do
        let(:cards) do
          [
            Card.new("A", "hearts"),
            Card.new("K", "spades"),
            Card.new("J", "hearts"),
            Card.new("Q", "diamonds"),
            Card.new("10", "hearts"),
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Face Cards" do
        let(:cards) do
          [
            Card.new("Q", "hearts"),
            Card.new("J", "spades"),
            Card.new("10", "clubs"),
            Card.new("9", "hearts"),
            Card.new("8", "spades")
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end
    end

    context "three of a kind" do
    end

    context "two pair" do
    end

    context "pair" do
    end

    context "high card" do
    end
  end
end