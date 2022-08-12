class Retweet < ApplicationRecord
  trigger.after(:insert) {
    <<-SQL
    UPDATE tweets SET num_retweets = num_retweets + 1 WHERE tweet_id = NEW.retweeted;
    SQL
  }
  trigger.after(:delete) {
    <<-SQL
    UPDATE tweets SET num_retweets = num_retweets - 1 WHERE tweet_id = OLD.retweeted;
    SQL
  }
end
