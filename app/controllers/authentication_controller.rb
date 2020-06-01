# frozen_string_literal: true

class AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:user][:email], params[:user][:password])

    if command.success?
      user = User.find_by(email: params[:user][:email])
      # session[:user_id] = user.id
      render json: { auth_token: command.result, user: user.email }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
