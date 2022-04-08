# frozen_string_literal: true

json.array! @conversation_users, partial: 'conversation_users/conversation_user', as: :conversation_user
