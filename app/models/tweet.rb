class Tweet < ApplicationRecord
  belongs_to :user, foreign_key: "handle"
  has_many :retweets, through: :retweets, foreign_key: "retweeted"
  has_many :retweeted_tweets, through: :retweets, foreign_key: "quote_tweet"
  has_many :likes, through: :likes
  default_scope -> { order(created_at: :desc) }
  trigger.after(:insert) {
    <<-SQL
    UPDATE users SET num_tweets = num_tweets + 1 WHERE handle = NEW.handle;
    SQL
  }
  trigger.after(:delete) {
    <<-SQL
    UPDATE users SET num_tweets = num_tweets - 1 WHERE handle = OLD.handle;
    SQL
  }
end
