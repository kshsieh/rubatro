require "factory_bot"

FactoryBot.define do
  factory :card do
    rank { DEFAULT_CARD_ATTRIBUTES.keys.sample }
    suit { Card::SUITS.keys.sample }

    initialize_with { new(rank: rank, suit: suit) }
  end

  factory :hand do
    # trait :full_house do
    #   toak_rank = DEFAULT_CARD_ATTRIBUTES.keys.sample
    #   pair_rank = DEFAULT_CARD_ATTRIBUTES.keys.reject { |k| k == toak_rank }.sample

      # cards do

      # end
    # end
  end
end
