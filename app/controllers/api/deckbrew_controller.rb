require 'net/http'
class Api::DeckbrewController < ApplicationController
  before_action :authenticate_user_token!
  def show
    uri = URI("http://api.deckbrew.com/mtg/cards/typeahead?q=#{params[:id]}")
    card = JSON.parse(Net::HTTP.get_response(uri).body)
    render json: {card: card.first}
  end
end
