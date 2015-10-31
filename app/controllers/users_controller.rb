class UsersController < ApplicationController
  before_action :current_user, only: [:index]

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

  def destroy
    logout
  end

  def login
    user = User.find_by_email(params[:email])
    if user.try(:authenticate, params[:password])
      @login = 'Login succeed'
      session[:user_id] = user.id
    else
      redirect_to :back
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def current_user
    @current_user = session[:user_id]
  end
end
