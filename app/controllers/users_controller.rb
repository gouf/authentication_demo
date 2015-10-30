class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      redirect_to :back
    end
  end

  def update
  end

  def delete
  end

  def login
    user = User.find_by_email(params[:email])
    if user.try(:authenticate, params[:password])
      @login = 'Login succeed'
    else
      redirect_to :back
    end
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end