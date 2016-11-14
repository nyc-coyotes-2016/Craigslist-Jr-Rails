class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, length: { minimum: 10, maximum: 200 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :location, presence: true
  validates :description, length: { minimum: 15, maximum: 1000 }, presence: true
  validates :reference_url, presence: true, uniqueness: true
  validates :category_id, :user_id, presence: true
end
