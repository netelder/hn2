class PostVote < ActiveRecord::Base
  belongs_to  :post
  belongs_to  :user


  # Remember to create a migration!
end
