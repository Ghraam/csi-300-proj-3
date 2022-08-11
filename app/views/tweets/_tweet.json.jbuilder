json.extract! tweet, :id, :handle, :content, :num_likes, :num_retweets, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
