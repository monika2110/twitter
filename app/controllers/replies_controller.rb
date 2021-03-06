# frozen_string_literal: true

class RepliesController < ApplicationController
  before_action :set_reply, only: %i[edit update destroy show]
  before_action :set_replyable
  before_action :authenticate_user!
  before_action :set_users

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show; end

  # GET /replies/new
  def new
    Reply.new
  end

  # GET /replies/1/edit
  def edit; end

  # POST /replies or /replies.json
  def create
    @reply = @replyable.replies.new(reply_params)
    @reply.user = current_user
    create_respond
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @replyable, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  def set_replyable
    if params[:reply_id]
      @replyable = Reply.find_by_id(params[:reply_id])
    elsif params[:tweet_id]
      @replyable = Tweet.find_by_id(params[:tweet_id])
    end
  end

  def create_respond
    respond_to do |format|
      if @reply.save
        Notification.create!(sender: current_user, recipient: @reply.replyable.user, source: @reply)
        format.html { redirect_to @replyable, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # Only allow a list of trusted parameters through.
  def reply_params
    params.require(:reply).permit(:content)
  end
end
