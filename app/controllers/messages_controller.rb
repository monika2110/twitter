# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[destroy update]
  before_action :find_conversation
  before_action :set_users

  # GET /messages or /messages.json
  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  # GET /messages/new
  def new
    @message = @conversation.messages.build
  end

  # POST /messages or /messages.json
  def create
    @message = @conversation.messages.build(message_params)
    @message.user = current_user
    ActionCable.server.broadcast('conversation_channel', { msg: render_message(@message) }) if @message.save
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to conversation_messages_path, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
