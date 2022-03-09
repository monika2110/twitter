# frozen_string_literal: true

json.extract! retweet, :id, :created_at, :updated_at
json.url retweet_url(retweet, format: :json)
