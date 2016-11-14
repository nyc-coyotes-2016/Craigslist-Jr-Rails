class Category < ActiveRecord::Base
  validates :title, presence: true
  has_many :articles
  has_many :users, through: :articles
end
