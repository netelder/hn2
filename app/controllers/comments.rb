get '/comments' do
  @comments = Comment.all
  erb :user_comments
end

post '/comments/vote/:comment_id' do
  user = current_user
  comment = Comment.find(params[:comment_id])
  unless CommentVote.find_by_user_id_and_comment_id(user.id, params[:comment_id])
    comment.score += 1
    CommentVote.create(:user_id => user.id, :comment_id => params[:comment_id])
    comment.save
  end
    p comment.score
  comment.score.to_s

end

post '/comments' do
  comment = Comment.new(body: params["body"])
  comment.user = current_user
  comment.post = Post.find(params["post_id"])
  comment.save
  redirect '/'
end


