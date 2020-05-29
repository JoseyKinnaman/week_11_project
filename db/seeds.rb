Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.spice,
                        cost: Faker::Number.between(from: 1, to: 10),
                        country_of_origin: Faker::Address.country) 
end

p "Created #{Product.count} products"