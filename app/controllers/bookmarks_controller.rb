# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_source
  before_action :set_users

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
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmarkp = current_user.bookmarks.find(params[:id])

    respond_to do |format|
      @bookmarkp.destroy
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source
    if params[:reply_id]
      @source = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @source = Tweet.find_by_id(params[:tweet_id])

    end
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.fetch(:bookmark, {})
  end
end
