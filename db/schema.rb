# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "follows", primary_key: ["follower", "followee"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "follower", limit: 15, null: false
    t.string "followee", limit: 15, null: false
    t.index ["followee"], name: "fk_user_has_user_user2_idx"
    t.index ["follower"], name: "fk_user_has_user_user1_idx"
  end

  create_table "likes", primary_key: ["handle", "tweet_id"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "handle", limit: 15, null: false
    t.integer "tweet_id", null: false
    t.index ["handle"], name: "fk_user_has_tweet_user1_idx"
    t.index ["tweet_id"], name: "fk_likes_tweets1_idx"
  end

  create_table "retweets", primary_key: ["quote_tweet", "retweeted"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "quote_tweet", null: false
    t.integer "retweeted", null: false
    t.index ["quote_tweet"], name: "fk_retweets_tweets1_idx"
    t.index ["retweeted"], name: "fk_users_has_tweets_tweets1_idx"
  end

  create_table "tweets", primary_key: "tweet_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "handle", limit: 15, null: false
    t.string "content", limit: 280
    t.integer "num_likes", default: 0, null: false
    t.integer "num_retweets", default: 0, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["handle"], name: "fk_tweets_users1_idx"
  end

  create_table "users", primary_key: "handle", id: { type: :string, limit: 15 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "screen_name", limit: 50, null: false
    t.string "email", limit: 45, null: false
    t.string "bio", limit: 260
    t.integer "num_followers", default: 0, null: false
    t.integer "num_following", default: 0, null: false
    t.integer "num_tweets", default: 0, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "follows", "users", column: "followee", primary_key: "handle", name: "fk_user_has_user_user2", on_delete: :cascade
  add_foreign_key "follows", "users", column: "follower", primary_key: "handle", name: "fk_user_has_user_user1", on_delete: :cascade
  add_foreign_key "likes", "tweets", primary_key: "tweet_id", name: "fk_likes_tweets1", on_delete: :cascade
  add_foreign_key "likes", "users", column: "handle", primary_key: "handle", name: "fk_user_has_tweet_user1", on_delete: :cascade
  add_foreign_key "retweets", "tweets", column: "quote_tweet", primary_key: "tweet_id", name: "fk_retweets_tweets1", on_delete: :cascade
  add_foreign_key "retweets", "tweets", column: "retweeted", primary_key: "tweet_id", name: "fk_users_has_tweets_tweets1", on_delete: :cascade
  add_foreign_key "tweets", "users", column: "handle", primary_key: "handle", name: "fk_tweets_users1", on_delete: :cascade
end
