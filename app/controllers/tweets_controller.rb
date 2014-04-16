class TweetsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :destroy]
  before_action :set_tweet, only: [:show, :destroy]

  def new
    @user = User.find(params[:user_id])
    @tweet = Tweet.new
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      render 'users/show.html.erb'
    end
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id)
  end
end
