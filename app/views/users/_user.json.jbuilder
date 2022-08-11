json.extract! user, :id, :screen_name, :email, :bio, :num_followers, :num_following, :num_tweets, :created_at, :updated_at
json.url user_url(user, format: :json)
