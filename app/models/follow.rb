class Follow < ApplicationRecord
  trigger.after(:insert) {
    <<-SQL
    UPDATE users SET num_followers = num_followers + 1 WHERE handle = NEW.followee;
    UPDATE users SET num_following = num_following + 1 WHERE handle = NEW.follower;
    SQL
  }
  trigger.after(:delete) {
    <<-SQL
    UPDATE users SET num_followers = num_followers - 1 WHERE handle = OLD.followee;
    UPDATE users SET num_following = num_following - 1 WHERE handle = OLD.follower;
    SQL
  }
end
