# frozen_string_literal: true

class RetweetsController < ApplicationController
  before_action :set_retweet, only: %i[show edit update destroy]
  before_action :set_retweetable
  before_action :authenticate_user!

  # GET /retweets or /retweets.json
  def index
    @retweets = Retweet.all
  end

  # GET /retweets/1 or /retweets/1.json
  def show; end

  # GET /retweets/new
  def new; end

  # GET /retweets/1/edit
  def edit; end

  # POST /retweets or /retweets.json
  def create
    @retweet = @retweetable.retweets.new(retweet_params)
    @retweet.user = current_user

    respond_to do |format|
      if @retweet.save
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @retweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @retweetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retweets/1 or /retweets/1.json
  def update
    respond_to do |format|
      if @retweet.update(retweet_params)
        format.html { redirect_to retweet_url(@retweet), notice: 'Retweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @retweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retweets/1 or /retweets/1.json
  def destroy
    @retweet = Retweet.find(params[:id])

    @retweet.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retweet
    @retweet = Retweet.find(params[:id])
  end

  def set_retweetable
    if params[:reply_id]
      @retweetable = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @retweetable = Tweet.find_by_id(params[:tweet_id])
    elsif params[:retweet_id]
      @retweetable = Retweet.find_by_id(params[:retweet_id])
    end
  end

  # Only allow a list of trusted parameters through.
  def retweet_params
    params.fetch(:retweet, {}).permit!
  end
end
