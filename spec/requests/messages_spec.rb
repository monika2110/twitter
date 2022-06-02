# rubocop:disable all

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/messages', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  current_user = User.first_or_create!(name: 'user', username: 'user', email: 'user@example.com', password: 'password',
                                       password_confirmation: 'password')
  conversation = Conversation.first_or_create!
  let(:invalid_attributes) do
    {
      'id' => 'a',

    }
  end
  let(:valid_attributes) do
    {
      'user_id' => current_user.id,
      'content' => 'text',
      'conversation_id' => conversation.id,
      'read' => false

    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      sign_in(current_user)
      message = Message.create! valid_attributes
      get conversation_messages_path(message.conversation)
      expect(response).to be_successful
    end
  end



  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Message' do
        expect do
          sign_in(current_user)
          post conversation_messages_path(conversation), params: { message: valid_attributes }
        end.to change(Message, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Message' do
        expect do
          post conversation_messages_path(conversation.id), params: { message: invalid_attributes }
        end.to change(Message, :count).by(0)
      end
    end
  end
end
