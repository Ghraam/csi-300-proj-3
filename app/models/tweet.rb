class Tweet < ApplicationRecord
  belongs_to :user, foreign_key: "handle"
  has_many :retweets, through: :retweets, foreign_key: "retweeted"
  has_many :retweeted_tweets, through: :retweets, foreign_key: "quote_tweet"
  has_many :likes, through: :likes
end
