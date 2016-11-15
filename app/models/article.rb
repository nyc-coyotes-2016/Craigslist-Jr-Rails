class Article < ActiveRecord::Base
  before_create :create_reference_url

  belongs_to :category
  validates :title, length: { minimum: 10, maximum: 200 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :location, presence: true
  validates :description, length: { minimum: 15, maximum: 1000 }, presence: true
  validates :reference_url, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true
  validates :category_id, presence: true

  def format_listing_title
    "#{self.title} - in #{self.location}, $#{self.price}"
  end

  def category_link
    "More listings in #{self.category.title}"
  end

  def create_reference_url
    self.reference_url = SecureRandom.urlsafe_base64
  end
end
