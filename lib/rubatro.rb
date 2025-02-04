class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def possible_hands
    HandEvaluator.new(self).perform!
  end
end

class Card
  # TODO: card validations
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end

class HandEvaluator
  # do we need the index? conver to an enum?
  HAND_DEFINITIONS = {
    royal_flush: 0,
    straight_flush: 1,
    # four_of_a_kind: 2,
    # full_house: 3,
    flush: 4,
    straight: 5,
    # three_of_a_kind: 6,
    # two_pair: 7,
    # pair: 8,
    # high_card: 9
  }

  CARD_VALUE_INDEX = {
    "A" => 14,
    "K" => 13,
    "Q" => 12,
    "J" => 11,
    "10" => 10,
    "9" => 9,
    "8" => 8,
    "7" => 7,
    "6" => 6,
    "5" => 5,
    "4" => 4,
    "3" => 3,
    "2" => 2
  }

  attr_accessor :hand, :results

  def initialize(hand)
    @hand = hand
    @results = []
  end

  def perform!
    HAND_DEFINITIONS.each do |hand_type, _value|
      results << hand_type if self.send("#{hand_type}?", hand.cards)
    end

    results
  end

  private

  def royal_flush?(cards)
    flush?(cards) &&
      straight?(cards) == :ace_high
  end

  def straight_flush?(cards)
    flush?(cards) && straight?(cards)
  end

  def flush?(cards)
    cards.map { |c| c.suit }.uniq.count == 1
  end

  def straight?(cards)
    card_indexes = cards.map { |c| card_value_to_index(c) }.sort

    # Check regular straight
    return :ace_high if consecutive?(card_indexes)

    # Check Ace-low straight (A,2,3,4,5)
    if card_indexes.include?(14) # Has an Ace
      ace_low_indexes = card_indexes.map { |i| i == 14 ? 1 : i }.sort
      return :ace_low if consecutive?(ace_low_indexes)
    end

    false
  end

  def consecutive?(indexes)
    indexes.each_cons(2).all? { |a, b| b == a + 1 }
  end

  def card_value_to_index(card)
    CARD_VALUE_INDEX[card.value]
  end
end
