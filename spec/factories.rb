require "factory_bot"

FactoryBot.define do
  factory :card do
    rank { DEFAULT_CARD_ATTRIBUTES.keys.sample }
    suit { Card::SUITS.keys.sample }

    initialize_with { new(rank: rank, suit: suit) }
  end
end
