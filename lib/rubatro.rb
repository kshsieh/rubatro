require_relative "hand_evaluator"
require_relative "defaults"
require_relative "card"

class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def possible_hands
    HandEvaluator.new(self).perform!
  end
end

class HandCalculator
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  # given a hand, returns an integer representing the hand's value
  # value is calculated based on:
  # chips * multiplier
  # chips is the sum of value of the cards + the base value of the hand
  # multiplier is set by the hand's level and can be modified by jokers and card modifiers
  def self.perform!(hand)
    chips * multiplier
  end

  private

  def chips

  end
end

# jokers are modifiers that can modify calculations and play in rubatro
# pareidolia modifies the hand so that all cards are considered face cards
# shortcut allows for straights to be built with gaps of 1
class Joker

end
