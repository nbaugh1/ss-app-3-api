# frozen_string_literal: true

class UsersController < ApiController
  skip_before_action :authenticate_request
  respond_to :json

  def create
    @user = User.create!(user_params)
    if @user.id.nil?
      @errors = @user.errors.full_messages
      render :new
    else
      auth = AuthenticateUser.call(user_params[:email], user_params[:password])
      if auth.success?
        # session[:user_id] = @user.id
        render json: { auth_token: auth.result }
      else
        render json: { error: auth.errors }, status: :unauthorized
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
