# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.id.nil?
      @errors = @user.errors.full_messages
      render :new
    else
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end
