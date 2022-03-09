class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :retweetable, polymorphic: true
  has_many :retweets, as: :retweetable
  has_many :replies, as: :replyable, dependent: :destroy


end
