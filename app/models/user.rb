class User < ActiveRecord::Base
    has_many :posts
    has_many :comments_received, through: :posts, source: :comments
    has_many :comments_written, class_name: "Co mment"

    validates :email, presence: true
    validates :email, format: { with: /.*@.*\..*/, message: "invalid email format"}
    validates :password_digest, presence: true

    include BCrypt

    def password
      @password ||= Password.new(password_digest)
    end

    def password=(pass)
      @password = Password.create(pass)
      self.password_digest = @password
    end

    def self.authenticate(email, given_password)
      user = User.find_by_email(email)
      if user && (user.password == given_password)
        return user
      else
        nil
      end
    end

end
