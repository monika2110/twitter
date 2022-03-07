# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :content, length: { maximum: 280 }
end
