get '/users/:id' do

  erb :profile
end

get '/users/comments/:id' do
  @user = User.find(params[:id])
  @comments = Comment.where("user_id = ?", @user.id)
  erb :user_comments
end

get '/users/posts/:id' do
  @user = current_user
  @posts = Post.where("user_id = ?", @user.id)
  erb :user_posts
end

get '/login' do 
  erb :login_signup
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/profile' do
  @user = current_user
  erb :profile
end

post '/users' do
  user = User.find_by_username(params["username"])
  unless user
    @user = User.new(username: params["username"])
    @user.password = params["password"]
    @user.save
    session[:user_id] = @user.id
  end
  @user
  redirect '/'
end

post '/login' do
  @user = User.find_by_username(params["username"])
  if @user.password == params["password"]
    session[:user_id] = @user.id
  else
    redirect '/login'
  end
  redirect '/'
end
