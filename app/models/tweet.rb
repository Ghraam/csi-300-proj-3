class Tweet < ApplicationRecord
  has_many :retweets, through: :retweets, foreign_key: "retweeted"
  has_many :retweeted_tweets, through: :retweets, foreign_key: "quote_tweet"
end
