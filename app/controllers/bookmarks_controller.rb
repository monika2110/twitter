class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_source

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.order('created_at DESC')
  end


  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = @source.bookmarks.new(bookmark_params)
    @bookmark.user = current_user

    respond_to do |format|
      if @bookmark.save
        format.html {  redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to bookmark_url(@bookmark), notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      if params[:reply_id]
        @source = Reply.find_by_id(params[:reply_id])
      elsif params[:retweet_id]
        @source = Retweet.find_by_id(params[:retweet_id])
      elsif params[:tweet_id]
        @source = Tweet.find_by_id(params[:tweet_id])

      end
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.fetch(:bookmark, {})
    end
end




