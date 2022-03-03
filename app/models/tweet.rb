# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :replies

  validates :content, presence: true
  validates :content, length: { maximum: 280 }
end
