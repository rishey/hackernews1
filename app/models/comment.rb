class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :sent_to, through: :posts, source: :users
  belongs_to :authored_by, class_name: "User"


  validates :text, presence: true 

end
