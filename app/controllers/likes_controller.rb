# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    @like = @likeable.likes.new(like_params)
    @like.user = current_user

    respond_to do |format|
      if @like.save
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like = current_user.likes.find(params[:id])
    respond_to do |format|
      @like.destroy
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

  def set_likeable
    if params[:reply_id]
      @likeable = Reply.find_by_id(params[:reply_id])
    elsif params[:retweet_id]
      @likeable = Retweet.find_by_id(params[:retweet_id])
    elsif params[:tweet_id]
      @likeable = Tweet.find_by_id(params[:tweet_id])

    end
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.fetch(:like, {})
  end
end
