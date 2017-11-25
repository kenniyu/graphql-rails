class User < ApplicationRecord
  include Clearance::User
  has_secure_token
  
  has_many :posts
end
