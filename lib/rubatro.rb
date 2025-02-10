require_relative "hand_evaluator"
require_relative "defaults"

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
  attr_accessor :rank, :suit, :chips
  attr_reader :index, :face_card

  SUITS = {
    H: "hearts",
    D: "diamonds",
    C: "clubs",
    S: "spades"
  }

  # TODO: assumption with facecard is for something like pareidolia,
  # but that might actually handled further upstream when calculating score with jokers
  def initialize(rank, suit, chips: nil, face_card: false)
    @rank = rank
    @suit = suit.to_sym
    @chips = chips || default_chips
    @index = set_index
    @face_card = default_face_card
  end

  def suit_to_s
    SUITS[suit]
  end

  def face_card?
    face_card
  end

  private

  def set_index
    ::DEFAULT_CARD_ATTRIBUTES[rank][:index]
  end

  def default_face_card
    ::DEFAULT_CARD_ATTRIBUTES[rank][:face_card] || false
  end

  def default_chips
    ::DEFAULT_CARD_ATTRIBUTES[rank][:chips]
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
