class Match < ApplicationRecord
  belongs_to :deck
  has_many :match_cards
  belongs_to :result
end
