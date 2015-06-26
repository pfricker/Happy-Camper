10.times do
  email = Faker::Internet.safe_email
  password = Faker::Internet.password
  username = Faker::Internet.user_name
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create!(email: email, password: password, username: username, first_name: first_name, last_name: last_name)
end
puts "#{User.all.count} users were generated"

user = User.all.sample
Backpack.create!(user_id: user.id, name: "Atmos AG 65", brand: "Osprey", capacity: 65, size: "medium", condition: "new")

user = User.all.sample
Backpack.create!(user_id: user.id, name: "Aether 70", brand: "Osprey", capacity: 70, size: "large", condition: "good")

user = User.all.sample
Backpack.create!(user_id: user.id, name: "Xena 85", brand: "Osprey", capacity: 85, size: "small", condition: "acceptable")

user = User.all.sample
Backpack.create!(user_id: user.id, name: "Amber 44", brand: "Gregory", capacity: 44, size: "xs", condition: "new")

user = User.all.sample
Backpack.create!(user_id: user.id, name: "Z55", brand: "Gregory", capacity: 55 , size: "medium", condition: "new")

puts "#{Backpack.all.count} packs were created"
