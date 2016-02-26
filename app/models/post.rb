class Post < ActiveRecord::Base
  validates :body, :title, presence: true
  has_many :comments
end