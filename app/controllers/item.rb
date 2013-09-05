get '/item/:id' do
 @post = Post.find(params[:id]) 

 erb :item
end
