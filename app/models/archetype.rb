class Archetype < ApplicationRecord
  belongs_to :format
  has_many :decks
  has_many :matches, foreign_key :opposing_archetype_id

end
