class Archetype < ApplicationRecord
  belongs_to :format
  has_many :decks
  has_many :matches

end
