# frozen_string_literal: true

json.array! @retweets, partial: 'retweets/retweet', as: :retweet
