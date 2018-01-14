class MatchCard < ApplicationRecord
  belongs_to :match
  belongs_to :deck_card

end
