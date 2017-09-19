class User < ApplicationRecord

  validates :username, :email, :password, :presence => true
  validates :username, :length => { :minimum => 4 }
  validates :username, :email, :uniqueness => { :message => "already taken!!" }

end
