require 'spec_helper'

RSpec.describe HandEvaluator do
  let(:hand) { Hand.new(cards) }
  subject { HandEvaluator.new(hand) }

  describe "#perform!" do
    context "royal flush" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "K", suit: :H),
          Card.new(rank: "Q", suit: :H),
          Card.new(rank: "J", suit: :H),
          Card.new(rank: "10", suit: :H)
        ]
      end

      it "returns :royal_flush" do
        expect(subject.perform!).to include(:royal_flush)
      end
    end

    context "straight flush" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "2", suit: :H),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "4", suit: :H),
          Card.new(rank: "5", suit: :H)
        ]
      end

      it "returns :straight_flush" do
        expect(subject.perform!).to include(:straight_flush)
      end
    end

    context "four of a kind" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "A", suit: :S),
          Card.new(rank: "A", suit: :D),
          Card.new(rank: "A", suit: :C),
          Card.new(rank: "3", suit: :H)
        ]
      end

      it "returns :four_of_a_kind" do
        expect(subject.perform!).to include(:four_of_a_kind)
      end
    end

    context "full house" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "A", suit: :S),
          Card.new(rank: "A", suit: :D),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "3", suit: :S)
        ]
      end

      it "returns :full_house" do
        expect(subject.perform!).to include(:full_house)
      end
    end

    context "flush" do
      let(:cards) do
        [
          Card.new(rank: "2", suit: :H),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "8", suit: :H),
          Card.new(rank: "J", suit: :H),
          Card.new(rank: "A", suit: :H)
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
            Card.new(rank: "4", suit: :C),
            Card.new(rank: "3", suit: :S),
            Card.new(rank: "6", suit: :S),
            Card.new(rank: "5", suit: :H),
            Card.new(rank: "2", suit: :H)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace low" do
        let(:cards) do
          [
            Card.new(rank: "3", suit: :H),
            Card.new(rank: "A", suit: :H),
            Card.new(rank: "4", suit: :D),
            Card.new(rank: "5", suit: :H),
            Card.new(rank: "2", suit: :S)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace high" do
        let(:cards) do
          [
            Card.new(rank: "A", suit: :H),
            Card.new(rank: "K", suit: :S),
            Card.new(rank: "J", suit: :H),
            Card.new(rank: "Q", suit: :D),
            Card.new(rank: "10", suit: :H)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Face Cards" do
        let(:cards) do
          [
            Card.new(rank: "Q", suit: :H),
            Card.new(rank: "J", suit: :S),
            Card.new(rank: "10", suit: :C),
            Card.new(rank: "9", suit: :H),
            Card.new(rank: "8", suit: :S)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end
    end

    context "three of a kind" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "A", suit: :S),
          Card.new(rank: "A", suit: :D),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "2", suit: :H)
        ]
      end

      it "returns :three_of_a_kind" do
        expect(subject.perform!).to include(:three_of_a_kind)
      end
    end

    context "two pair" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "A", suit: :S),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "3", suit: :S),
          Card.new(rank: "2", suit: :H)
        ]
      end

      it "returns :two_pair" do
        expect(subject.perform!).to include(:two_pair)
      end
    end

    context "pair" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "A", suit: :S),
          Card.new(rank: "3", suit: :H),
          Card.new(rank: "2", suit: :H)
        ]
      end

      it "returns :pair" do
        expect(subject.perform!).to include(:pair)
      end
    end

    context "high card" do
      let(:cards) do
        [
          Card.new(rank: "A", suit: :H),
          Card.new(rank: "K", suit: :S),
          Card.new(rank: "J", suit: :H),
          Card.new(rank: "Q", suit: :D),
          Card.new(rank: "10", suit: :H)
        ]
      end

      it "returns :high_card" do
        expect(subject.perform!).to include(:high_card)
      end
    end
  end
end
