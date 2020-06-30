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

  def auth_ss
    client = Smartsheet::Client.new(token: ENV['SS_TOKEN'])
    code = params[:code]
    string = ENV['SS_CLIENT_SECRET'] + '|' + code
    hash = Digest::SHA256.hexdigest string
    resp = client.token.get(
      client_id: ENV['SS_CLIENT_ID'],
      code: code,
      hash: hash
    )
    session[:ss_auth_token] = resp[:access_token]
    session[:ss_token_type] = resp[:token_type]
    # byebug

    puts '*********Access Token Granted (stored in session)***********'
    redirect_to '/home'
  end

  def get_ss_token
    byebug
  end
end
