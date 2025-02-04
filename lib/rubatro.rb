require_relative "hand_evaluator"
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
