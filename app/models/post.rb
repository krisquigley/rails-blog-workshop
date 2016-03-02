class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged

  validates :body, :title, presence: true
  has_many :comments
  belongs_to :category
end