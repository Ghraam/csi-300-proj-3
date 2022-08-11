json.extract! retweet, :id, :quote_tweet, :retweeted, :created_at, :updated_at
json.url retweet_url(retweet, format: :json)
