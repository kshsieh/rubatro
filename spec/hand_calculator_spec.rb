require "spec_helper"

RSpec.describe HandCalculator do
  subject { described_class.new(hand) }

  describe "#perform!" do
    # TODO: test every hand and expected output?
      # https://www.reddit.com/r/balatro/comments/1bjomem/base_scores_for_hand_levels_115/#lightbox
    context "base level hand" do
      let(:hand_type) { HandType.new(:full_house) }
      let(:hand) { FactoryBot.build(:hand, :full_house) }

      it "returns the correct score" do
        pending
        expected_chips = (hand.cards.map(&:chips).sum + hand_type.chips)* hand_type.mult
        expect(subject).to eq(expected_chips)
      end
    end

    context "upgraded hand level" do
      it "returns the correct score"
    end

    context "jokers" do
      context "+mult" do
        it "returns the correct score"
      end

      context "xmult" do
        it "returns the correct score"
      end
      # TODO: other modifiers
    end
  end
end