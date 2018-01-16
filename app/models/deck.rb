class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_cards
  has_many :matches
  belongs_to :archetype

  def maindeck
    deck_cards.where(sideboard: false).as_json
  end
  def sideboard
    deck_cards.where(sideboard: true).as_json
  end
end
