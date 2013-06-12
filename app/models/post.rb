class Post < ActiveRecord::Base
  belongs_to  :user
  has_many    :comments
  # Remember to create a migration!
end
