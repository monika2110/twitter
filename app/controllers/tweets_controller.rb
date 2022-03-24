# rubocop:disable all

class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create edit update destroy]
  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @reply = Reply.new
    @replies = Reply.where(replyable_id: @tweet.id).order('created_at DESC')
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.build
    if params[:source_type]
      @source_id = Tweet.find(params[:source_id])
      @type = params[:source_type]
      render :new_retweet
    else
      render :new
    end
  end

  # GET /tweets/1/edit
  def edit; end

  # POST /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_back(fallback_location: tweet_url(@tweet)) }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html {  redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:content, :source_id, :source_type)
  end
end
