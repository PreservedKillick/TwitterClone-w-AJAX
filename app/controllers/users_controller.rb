class UsersController < ApplicationController
  def index
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    else
      render 'index'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:password, :email, :handle, :name, :password_confirmation)
  end
end

