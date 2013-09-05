get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  if params.has_key?("new_user_email") && params.has_key?("new_user_password")
    @user = User.create(email: params[:new_user_email], password: params[:new_user_password])
    if @user.id
      session[:user_id] = @user.id
    else
      @error = "Wrong data, try to login again"
    end


  else
    @user = User.authenticate(params[:user_email],params[:user_password])
  end

  if @user
  session[:user_id] = @user.id
  else
    @error = "User validation falied"
  end

  erb :index
end

get '/logout' do
  session.clear
  redirect ("/")
end
