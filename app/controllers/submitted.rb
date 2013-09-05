get '/submitted/:id' do
 @user = User.find(params[:id]) 

 erb :submitted
end
