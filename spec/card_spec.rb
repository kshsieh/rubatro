require "spec_helper"

RSpec.describe Card do
  describe "#initialize" do
    it "sets rank" do
      card = Card.new("A", :H)
      expect(card.rank).to eq("A")
    end

    it "sets suit" do
      card = Card.new("5", :S)
      expect(card.suit).to eq(:S)
      expect(card.suit_to_s).to eq("spades")
    end

    it "derives chips from value" do
      card = Card.new("J", :C)
      expect(card.chips).to eq(10)
    end

    context "setting chips" do
      it "returns set chips" do
        card = Card.new("J", :C, chips: 50)
        expect(card.chips).to eq(50)
      end
    end

    it "derives face boolean from value" do
      face_card = Card.new("K", :D)
      number_card = Card.new("2", :H)
      expect(face_card.face_card?).to eq(true)
      expect(number_card.face_card?).to eq(false)
    end
  end
end