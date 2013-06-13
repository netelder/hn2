get '/posts/new' do
  if logged_in?
    erb :post
  else
    redirect '/login'
  end
end

get '/posts/:id' do
  @post=Post.find(params[:id])
  p @comments = Comment.where("post_id = ?", @post.id)
  erb :show_post_comments #also allows for adding comment?
end

post '/posts/vote/:post_id' do
  post = Post.find(params[:post_id])
  if logged_in?
    user = current_user
    unless PostVote.find_by_user_id_and_post_id(user.id, params[:post_id])
      post.score += 1
      PostVote.create(:user_id => user.id, :post_id => params[:post_id])
      post.save
    end
  end
  post.score.to_s
end

post '/posts/:id' do

  redirect '/'
end

post '/posts' do
  @post = Post.new(params)
  @post.user = current_user
  @post.save
  redirect "/posts/#{@post.id}"
end




