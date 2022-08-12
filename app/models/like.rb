class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user, foreign_key: "handle"
  trigger.after(:insert) {
    <<-SQL
    UPDATE tweets SET num_likes = num_likes + 1 WHERE tweet_id = NEW.tweet_id;
    SQL
  }
  trigger.after(:delete) {
    <<-SQL
    UPDATE tweets SET num_likes = num_likes - 1 WHERE tweet_id = OLD.tweet_id;
    SQL
  }
end
