
3.times do
    Shop.create({
        name: Faker::Commerce.department,
        address: Faker::Address.full_address
    })
end

