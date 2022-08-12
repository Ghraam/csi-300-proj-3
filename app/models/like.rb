class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user, foreign_key: "handle"
end
