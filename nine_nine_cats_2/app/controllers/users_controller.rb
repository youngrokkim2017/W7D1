class UsersController < ApplicationController
  # attr_reader :password
  before_action :require_logged_out, only: [:new, :create]
  # before_action :require_logged_in, only: [:index]

  def new
    render :new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :session_token, :password_digest, :password)
  end
end
