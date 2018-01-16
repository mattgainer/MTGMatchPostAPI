class Match < ApplicationRecord
  belongs_to :deck
  has_many :match_cards
  belongs_to :result
  belongs_to :opposing_archetype, class_name: "Archetype", foreign_key: :opposing_archetype_id
end
