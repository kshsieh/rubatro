require "spec_helper"

RSpec.describe Card do
  describe "#initialize" do
    it "has all attributes" do
      card = FactoryBot.build(:card)
      expect(card).to respond_to(:rank)
      expect(card).to respond_to(:suit)
      expect(card).to respond_to(:chips)
      expect(card).to respond_to(:face_card?)
    end

    it "sets rank" do
      card = Card.new(rank: "A", suit: :H)
      expect(card.rank).to eq("A")
    end

    it "sets suit" do
      card = Card.new(rank: "5", suit: :S)
      expect(card.suit).to eq(:S)
      expect(card.suit_to_s).to eq("spades")
    end

    it "derives chips from value" do
      card = Card.new(rank: "J", suit: :C)
      expect(card.chips).to eq(10)
    end

    context "setting chips" do
      it "returns set chips" do
        card = Card.new(rank: "J", suit: :C, chips: 50)
        expect(card.chips).to eq(50)
      end
    end

    it "derives face boolean from value" do
      face_card = Card.new(rank: "K", suit: :D)
      number_card = Card.new(rank: "2", suit: :H)
      expect(face_card.face_card?).to eq(true)
      expect(number_card.face_card?).to eq(false)
    end
  end
end