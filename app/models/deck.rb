class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :matches
  belongs_to :archetype
end
