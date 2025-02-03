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
    # royal_flush: 0,
    # straight_flush: 1,
    # four_of_a_kind: 2,
    # full_house: 3,
    flush: 4,
    straight: 5,
    # three_of_a_kind: 6,
    # two_pair: 7,
    # pair: 8,
    # high_card: 9
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
      straight?(cards) # && first card is A
  end

  def flush?(cards)
    cards.map { |c| c.suit }.uniq.count == 1
  end

  def straight?(cards)
    debugger
  end
end
