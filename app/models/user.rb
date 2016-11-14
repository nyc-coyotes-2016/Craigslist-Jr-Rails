class User < ActiveRecord::Base
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true
  has_many :articles
  has_many :listed_categories, through: :articles, source: :category
end
