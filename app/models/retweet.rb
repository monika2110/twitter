# frozen_string_literal: true

class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :retweetable, polymorphic: true
  has_many :retweets, as: :retweetable, dependent: :destroy
  has_many :replies, as: :replyable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
