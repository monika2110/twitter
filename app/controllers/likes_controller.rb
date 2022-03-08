class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    tweet = Tweet.find(params[:tweet_id])
    @like = Like.new(user_id: current_user.id, tweet_id: tweet.id)

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
      format.html { redirect_back(fallback_location: root_path)}
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:tweet_id)
    end
end


