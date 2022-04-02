# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :followers, foreign_key: :followee_id, class_name: 'Relation'
  has_many :followees, foreign_key: :follower_id, class_name: 'Relation'
  has_many :replies, dependent: :destroy
  has_many :retweets, as: :source, dependent: :destroy, class_name: 'Tweet'
  has_many :likes
  has_many :messages
  has_many :conversations
  has_many :notifications, foreign_key: :recipient_id, class_name: 'Notification'

  has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :avatar, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i, message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
