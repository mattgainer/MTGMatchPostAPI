class Api::MatchesController < ApplicationController
  before_action :authenticate_user_token!
  def index
    # if match_params[:archetype]
    #   @matches = Match.joins(:deck).where("deck.archetype_id = (?)", match_params[:archetype])
    # else
      @matches = Match.all
    # end
    # if match_params[:opposing_archetype]
    #   @matches = @matches.where(opposing_archetype_id: match_params[:opposing_archetype])
    # end
    # if match_params[:result]
    #   @matches = @matches.where(result_id: match_params[:result])
    # end
    render json: {matches: @matches.as_json(
        include: [
          {
            deck: {
              include: [
                :user,
                {
                  archetype: {
                    include: :format
                  }
                }
              ]
            }
          },
          :opposing_archetype,
          :result
        ]
      )
    }
  end

  def show
    @match = Match.find(params[:id])
    render json: {
      match: @match.as_json(
        include: [
          {
            deck: {
              include: [
                :user,
                {
                  archetype: {include: :format}
                },
                :deck_cards
              ]
            }
          },
          :opposing_archetype,
          :result,
          {
            match_cards: {
              include: :deck_card
            }
          },
        ]
      )
    }
  end
  def create
    @match = Match.new(match_params)
    if @match.save
      match_cards = match_card_in_params[:match_cards_in].map{|card| card.merge({in: true, match_id: @match.id})} +
                    match_card_out_params[:match_cards_out].map{|card| card.merge({in: false, match_id: @match.id})}
      all_match_card = MatchCard.create(
        match_cards
      )
      render json: {match: @match}
    else
      render json: {errors: @match.errors.full_messages}
    end
  end

  private

  def match_params
    params.require(:match).permit(:archetype, :opposing_archetype_id, :result_id, :deck_id, :writeup)
  end
  def match_card_in_params
    params.require(:match).permit({match_cards_in: [:deck_card_id, :quantity]})
  end
  def match_card_out_params
    params.require(:match).permit({match_cards_out: [:deck_card_id, :quantity]})
  end
end
