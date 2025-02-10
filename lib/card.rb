
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
  def initialize(rank: rank, suit: suit, chips: nil, face_card: false)
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