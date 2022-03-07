class Like < ApplicationRecord
  belongs_to :tweet, foreign_key: :tweet_id, class_name: "Tweet"

  belongs_to :user, foreign_key: :user_id, class_name: "User"
  validates :followee_id, uniqueness: { scope: :follower_id }

end
