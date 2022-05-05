# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: %i[show edit update destroy]

  # GET /conversations or /conversations.json
  def index
    invalid_conversation = Conversation.where(private: false).and(Conversation.where(topic: nil))
    invalid_conversation.destroy_all if invalid_conversation.present?
    @conversations = Conversation.all.order('created_at DESC')
    @users = User.where.not(id: current_user)
  end

  def new_group
    @users = User.where.not(id: current_user)
  end

  # GET /conversations/1 or /conversations/1.json
  def show
    @conversations = Conversation.all
    @users = User.where.not(id: current_user)
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new(conversation_params)
  end

  # POST /conversations or /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.valid?
        if @conversation.private
          conversation = Conversation.find_direct(current_user, User.find(params[:user_ids].first))

          return redirect_to(conversation_messages_path(conversation)) if conversation.present?
        end

        ConversationUser.create!(conversation: @conversation, user: current_user)
        @conversation.save

        format.html do
          redirect_to conversation_messages_path(@conversation, locale: I18n.locale), notice: 'Conversation was successfully created.'
        end
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html do
          redirect_to(conversation_messages_path(@conversation))
        end
        format.json { render :show, status: :ok, location: @conversation_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversation_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1 or /conversations/1.json
  def destroy
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def conversation_params
    if params[:conversation]
      params.require(:conversation).permit(:topic, :private, user_ids: [])
    else
      params.permit(:topic, :private, user_ids: [])
    end
  end
end
