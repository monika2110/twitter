# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :followers, foreign_key: :followee_id, class_name: "Relation"
  has_many :followees, foreign_key: :follower_id, class_name: "Relation"
  has_many :replies

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
