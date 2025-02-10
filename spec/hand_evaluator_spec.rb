require 'spec_helper'

RSpec.describe HandEvaluator do
  let(:hand) { Hand.new(cards) }
  subject { HandEvaluator.new(hand) }

  describe "#perform!" do
    context "royal flush" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("K", :H),
          Card.new("Q", :H),
          Card.new("J", :H),
          Card.new("10", :H)
        ]
      end

      it "returns :royal_flush" do
        expect(subject.perform!).to include(:royal_flush)
      end
    end

    context "straight flush" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("2", :H),
          Card.new("3", :H),
          Card.new("4", :H),
          Card.new("5", :H)
        ]
      end

      it "returns :straight_flush" do
        expect(subject.perform!).to include(:straight_flush)
      end
    end

    context "four of a kind" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("A", :S),
          Card.new("A", :D),
          Card.new("A", :C),
          Card.new("3", :H)
        ]
      end

      it "returns :four_of_a_kind" do
        expect(subject.perform!).to include(:four_of_a_kind)
      end
    end

    context "full house" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("A", :S),
          Card.new("A", :D),
          Card.new("3", :H),
          Card.new("3", :S)
        ]
      end

      it "returns :full_house" do
        expect(subject.perform!).to include(:full_house)
      end
    end

    context "flush" do
      let(:cards) do
        [
          Card.new("2", :H),
          Card.new("3", :H),
          Card.new("8", :H),
          Card.new("J", :H),
          Card.new("A", :H)
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
            Card.new("4", :C),
            Card.new("3", :S),
            Card.new("6", :S),
            Card.new("5", :H),
            Card.new("2", :H)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace low" do
        let(:cards) do
          [
            Card.new("3", :H),
            Card.new("A", :H),
            Card.new("4", :D),
            Card.new("5", :H),
            Card.new("2", :S)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Ace high" do
        let(:cards) do
          [
            Card.new("A", :H),
            Card.new("K", :S),
            Card.new("J", :H),
            Card.new("Q", :D),
            Card.new("10", :H)
          ]
        end

        it "returns :straight" do
          expect(subject.perform!).to include(:straight)
        end
      end

      context "straight with Face Cards" do
        let(:cards) do
          [
            Card.new("Q", :H),
            Card.new("J", :S),
            Card.new("10", :C),
            Card.new("9", :H),
            Card.new("8", :S)
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
          Card.new("A", :H),
          Card.new("A", :S),
          Card.new("A", :D),
          Card.new("3", :H),
          Card.new("2", :H)
        ]
      end

      it "returns :three_of_a_kind" do
        expect(subject.perform!).to include(:three_of_a_kind)
      end
    end

    context "two pair" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("A", :S),
          Card.new("3", :H),
          Card.new("3", :S),
          Card.new("2", :H)
        ]
      end

      it "returns :two_pair" do
        expect(subject.perform!).to include(:two_pair)
      end
    end

    context "pair" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("A", :S),
          Card.new("3", :H),
          Card.new("2", :H)
        ]
      end

      it "returns :pair" do
        expect(subject.perform!).to include(:pair)
      end
    end

    context "high card" do
      let(:cards) do
        [
          Card.new("A", :H),
          Card.new("K", :S),
          Card.new("J", :H),
          Card.new("Q", :D),
          Card.new("10", :H)
        ]
      end

      it "returns :high_card" do
        expect(subject.perform!).to include(:high_card)
      end
    end
  end
end
