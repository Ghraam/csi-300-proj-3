# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  user = User.create(handle: Faker::Internet.username[0...15], screen_name: Faker::Name.name, email: Faker::Internet.email, bio: Faker::Lorem.paragraph)
  rand(10).times do
    Tweet.create(handle: user.handle, content: Faker::Lorem.paragraph)
  end
end

User.all.each do |follower|
  User.all.each do |followee|
    if follower != followee && rand(2) == 0
      Follow.create(follower: follower.handle, followee: followee.handle)
    end
  end
end

tweets = Tweet.all
User.all.each do |user|
  tweets.shuffle[0...5].each do |tweet|
    quote_tweet = Tweet.create(handle: user.handle, content: Faker::Lorem.paragraph)
    Retweet.create(quote_tweet: quote_tweet.tweet_id, retweeted: tweet.tweet_id)
  end
end

User.all.each do |user|
  Tweet.all.each do |tweet|
    if rand(2) == 0
      Like.create(handle: user.handle, tweet: tweet)
    end
  end
end
