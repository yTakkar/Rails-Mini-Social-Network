class Post < ApplicationRecord

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 5, :maximum => 250 }
  validates :content, :length => { :minimum => 5 }

end
