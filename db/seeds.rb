
javier = User.create(email: "javier@dev.com", password: 1)
richard = User.create(email: "richard@dev.com", password: 2)
brett = User.create(email: "brett@dev.com", password: 3)

javier.posts << Post.create(title: Faker::Lorem.sentence, url: Faker::Internet.url)

Comment.create(text: Faker::Lorem.sentence, post_id: 1, user_id: 2)
Comment.create(text: Faker::Lorem.sentence, post_id: 1, user_id: 3)

# new comment id 3 
new_comment = Comment.create(text: Faker::Lorem.sentence)

javier.posts.first.comments << new_comment

richard.comments_written << new_comment

javier has 1 post
richard and brett comment on the posts

javier should have their comments 
  javier.comments_received should == 2 comments 

richards should have 1 made comment 
  richard.comments_written , should see 1 comment 

brett should have 1 made comment 
  brett.comments_written should see 1 comment 

javier



# 5.times do 
#   javier.posts << Post.create(title: Faker::Lorem.sentence, url: Faker::Internet.url)
# end
# javier.posts.each do |post|
#   post.comments << Comment.create(text: Faker::Lorem.sentence)
# end

# 5.times do 
#   richard.posts << Post.create(title: Faker::Lorem.sentence, url: Faker::Internet.url)
# end

# 15.times do 
#   brett.comments << Comment.create(text: Faker::Lorem.sentence)
# end

# 15.times do 
#   richard.comments << Comment.create(text: Faker::Lorem.sentence)
# end
