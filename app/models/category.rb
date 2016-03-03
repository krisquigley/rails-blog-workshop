class Category < ActiveRecord::Base  
  validates :name, presence: true
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :posts
end