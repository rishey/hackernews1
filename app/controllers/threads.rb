get '/threads/:id' do
  @user = User.find(params[:id]) 

  erb :threads
end
