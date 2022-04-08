# frozen_string_literal: true

json.extract! convesation_user, :id, :created_at, :updated_at
json.url convesation_user_url(convesation_user, format: :json)
