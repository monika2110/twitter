# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :replyable, polymorphic: true
  has_many :replies, as: :replyable, dependent: :destroy
  has_many :retweets, as: :retweetable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :content, presence: true
end
