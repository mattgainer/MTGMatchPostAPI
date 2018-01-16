class ApplicationController < ActionController::API
  private
  def authenticate_user_token!
    # token = request.headers["Authorization"] && request.headers["Authorization"].split(" ")[1]
    # request_method = request.request_method
    # user = User.find_by(token: token)
    # case user
    # when nil
    #   render json: {error: "unauthorized"}, status: 401
    # else
    #   case request_method
    #   when "POST", "PATCH", "DELETE"
    #     valid_user = (user.id == secure_params[:user_id])
    #     case valid_user
    #     when false
    #       render json: {error: "unauthorized"}, status: 401
    #     end
    #   end
    # end
  end
  def secure_params
    params.require(controller_name.split("Controller").first.underscore.singularize.to_sym).permit(:user_id)
  end
end
