class Api::DecksController < ApplicationController
  before_action :authenticate_user_token!
  def index
    @decks = Deck.where(user_id: params[:user_id])
    render json: {decks: @decks.as_json(include: :archetype)}
  end

  def show
    @deck = Deck.find(params[:id])
    render json: {
      deck: @deck.as_json(
        methods: [:maindeck, :sideboard]
      )
    }
  end
  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      cards = deck_card_params[:cards].map{|card| card.merge({deck_id: @deck.id})}
      DeckCard.create(cards)
      render json: @deck.as_json(include: :deck_cards)
    else
      render json: {error: @deck.errors.full_messages}, status: 400
    end
  end
  private

  def deck_params
    params.require(:deck).permit(:user_id, :archetype_id, :name)
  end

  def deck_card_params
    params.require(:deck).permit({cards: [:card_id, :quantity, :sideboard]})
  end
end
