# frozen_string_literal: true

json.extract! reply, :id, :content, :tweet_id, :user_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
