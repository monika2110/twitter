# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_reply_tweet
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    devise_parameter_sanitizer.permit(:update_account, keys: %i[name username avatar])
    @tweet = Tweet.new
  end

  def index
    followee_id = Relation.select(:followee_id).where(follower_id: current_user.id)
    @tweets = (Tweet.where(user_id: followee_id).or(Tweet.where(user_id: current_user.id))).order('created_at DESC')
  end

  private

  def set_reply_tweet
    @reply = Reply.new
    @tweet = Tweet.new
  end
end
