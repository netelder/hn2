get '/comments' do
  @comments = Comment.all
  erb :user_comments
end


post '/comments' do
  comment = Comment.new(body: params["body"])
  comment.user = current_user
  comment.post = Post.find(params["post_id"])
  comment.save
  redirect '/'
end

