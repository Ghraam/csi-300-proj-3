class User < ApplicationRecord
  has_many :followers, through: :follows, foreign_key: "followee"
  has_many :following, through: :follows, foreign_key: "follower"
  has_many :tweets
end
