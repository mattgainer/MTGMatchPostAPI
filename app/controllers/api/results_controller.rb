class Api::ResultsController < ApplicationController
  before_action :authenticate_user_token!
  def index
    @results = Result.all
    render json: {results: @results.as_json}
  end
end
