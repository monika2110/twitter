# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    devise_parameter_sanitizer.permit(:update_account, keys: %i[name username])
  end

  def index
    followee_id = Relation.select(:followee_id).where(follower_id: current_user.id)
    @tweets = (Tweet.where(user_id: followee_id).or(Tweet.where(user_id: current_user.id))).order('created_at DESC')
    @tweet = Tweet.new
    @retweets = (Retweet.where(user_id: followee_id).or(Retweet.where(user_id: current_user.id))).order('created_at DESC')
    @combine = (Retweet.where(user_id: followee_id).or(Retweet.where(user_id: current_user.id)) + Tweet.where(user_id: followee_id).or(Tweet.where(user_id: current_user.id))).sort_by(&:created_at).reverse
  end
end
