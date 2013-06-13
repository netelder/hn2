class Post < ActiveRecord::Base
  belongs_to  :user
  has_many    :comments

  has_many    :post_votes
  # Remember to create a migration!
end
