30.times do
  email = Faker::Internet.safe_email
  password = Faker::Internet.password
  username = Faker::Internet.user_name
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create!(email: email, password: password, username: username, first_name: first_name, last_name: last_name)
end
puts "#{User.all.count} users were generated"

packs = [
  ["Atmos AG 65", "Osprey", 65, "mens"],
  ["Atmos AG 50", "Osprey", 50, "mens"],
  ["Xenith 105", "Osprey", 105, "mens"],
  ["Xenith 88", "Osprey", 88, "mens"],
  ["Aether 70", "Osprey", 70, "mens"],
  ["Aether 60", "Osprey", 60, "mens"],
  ["Volt 60", "Osprey", 60, "mens"],
  ["Kestrel 48", "Osprey", 48, "mens"],
  ["Stratos 36", "Osprey", 36, "mens"],
  ["Aura AG 65", "Osprey", 65, "womens"],
  ["Aura AG 50", "Osprey", 50, "womens"],
  ["Xena 85", "Osprey", 85, "womens"],
  ["Xena 70", "Osprey", 70, "womens"],
  ["Ariel 75", "Osprey", 75, "womens"],
  ["Ariel 65", "Osprey", 65, "womens"],
  ["Kyte 46", "Osprey", 46, "womens"],
  ["Sirrus 24", "Osprey", 24, "womens"],
  ["Exos 48", "Osprey", 48],
  ["Talon 33", "Osprey", 33, "mens"],
  ["Tempest 30", "Osprey", 30, "womens"],
  ["Baltoro 75", "Gregory", 75, "mens"],
  ["Z55", "Gregory", 55, "mens"],
  ["Contour 60", "Gregory", 60, "mens"],
  ["Contour 70", "Gregory", 70, "mens"],
  ["Savant 48", "Gregory", 48, "mens"],
  ["Whitney 95", "Gregory", 95, "mens"],
  ["Palisade 80", "Gregory", 80, "mens"],
  ["Amber 60", "Gregory", 60, "womens"],
  ["Deva 70", "Gregory", 70, "womens"],
  ["Deva 80", "Gregory", 85, "women"],
  ["Cairn 58", "Gregory", 58, "womens"],
  ["Sage 45", "Gregory", 45, "womens"],
  ["Altra 85", "Arc'Teryx", 85, "mens"],
  ["Altra 65", "Arc'Teryx", 65, "mens"],
  ["Altra 62", "Arc'Teryx", 62, "womens"],
  ["Alpha 45", "Arc'Teryx", 45]
]

packs.each do |pack|
  condition = ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"].sample
  size = ["XS", "S", "M", "L", "XL"].sample
  user = User.all.sample
  Backpack.create!(user_id: user.id, name: pack[0], brand: pack[1], capacity: pack[2], size: size, condition: condition, gender: pack[3])
end

puts "#{Backpack.all.count} packs were created"
