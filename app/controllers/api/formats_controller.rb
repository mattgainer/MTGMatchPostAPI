class Api::FormatsController < ApplicationController
  before_action :authenticate_user_token!

  def index
    @formats = Format.all
    render json: {formats: @formats.as_json(include: :archetypes)}
  end
end