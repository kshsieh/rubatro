class HandEvaluator
  # TODO: fancy balatro hands i.e. five of a kind, flush house, flush five
  # do we need the index? conver to an enum?
  HAND_DEFINITIONS = {
    royal_flush: 0,
    straight_flush: 1,
    four_of_a_kind: 2,
    full_house: 3,
    flush: 4,
    straight: 5,
    three_of_a_kind: 6,
    two_pair: 7,
    pair: 8,
    high_card: 9
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

  def four_of_a_kind?(cards)
    count_by_value(cards).any? { |_, count| count == 4 }
  end

  def full_house?(cards)
    count_by_value(cards).any? { |_, count| count == 3 } &&
      count_by_value(cards).any? { |_, count| count == 2 }
  end

  def three_of_a_kind?(cards)
    count_by_value(cards).any? { |_, count| count == 3 }
  end

  def two_pair?(cards)
    count_by_value(cards)
      .select { |_, count| count >=2 }
      .count == 2
  end

  def pair?(cards)
    count_by_value(cards).any? { |_, count| count == 2 }
  end

  # TODO: how does Four Fingers work?
  def flush?(cards)
    cards.map { |c| c.suit }.uniq.count == 1
  end

  # TODO: how does Four Fingers	and Shortcut work?
  def straight?(cards)
    card_indexes = cards.map(&:index).sort

    # Check regular straight
    return :ace_high if consecutive?(card_indexes)

    # Check Ace-low straight (A,2,3,4,5)
    if card_indexes.include?(13) # Has an Ace
      ace_low_indexes = card_indexes.map { |i| i == 13 ? 0 : i }.sort
      return :ace_low if consecutive?(ace_low_indexes)
    end

    false
  end

  def high_card?(cards)
    true
  end

  def count_by_value(cards)
    cards.group_by { |c| c.rank }.transform_values(&:count)
  end

  def consecutive?(indexes)
    indexes.each_cons(2).all? { |a, b| b == a + 1 }
  end
end
