8.times do
  Category.create!(title: Faker::Commerce.department)
end

categories = (1..8).to_a

100.times do
  Article.create!(title: Faker::Commerce.product_name, price: rand(1..250), location: Faker::Address.city, description: Faker::Hipster.sentence, reference_url: SecureRandom.urlsafe_base64, email: Faker::Internet.email, category_id: categories.sample)
end
