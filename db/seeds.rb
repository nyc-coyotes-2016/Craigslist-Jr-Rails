20.times do
  User.create!(email: Faker::Internet.email)
end

8.times do
  Category.create!(title: Faker::Commerce.department)
end

ids = (1..20).to_a
categories = (1..8).to_a

100.times do
  Article.create!(title: Faker::Commerce.product_name, price: rand(1..250), location: Faker::Address.city, description: Faker::Hipster.sentence, reference_url: SecureRandom.urlsafe_base64, category_id: categories.sample, user_id: ids.sample)
end
