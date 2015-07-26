500.times do
  email = Faker::Internet.safe_email
  password = Faker::Internet.password
  username = Faker::Internet.user_name + "_#{rand(99999)}"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  location = Faker::Address.zip

  User.create(email: email, password: password, username: username, first_name: first_name, last_name: last_name, location: location)
end

condition = ["New", "Like New", "Very Good", "Good", "Acceptable", "Seen Better Days"].sample
pack_size = ["XS", "S", "M", "L", "XL"].sample
bag_size = ["Womens", "Reg", "Long"].sample

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

tents = [
  ["Scout UL2", "Big Agnes", 2, "Ultra Light"],
  ["Fly Creek UL1", "Big Agnes", 1, "Ultra Light"],
  ["Fly Creek UL2", "Big Agnes", 2, "Ultra Light"],
  ["Fly Creek UL3", "Big Agnes", 3, "Ultra Light"],
  ["Copper Spur UL1", "Big Agnes", 1, "Ultra Light"],
  ["Copper Spur UL2", "Big Agnes", 2, "Ultra Light"],
  ["Copper Spur UL3", "Big Agnes", 3, "Ultra Light"],
  ["Copper Spur UL4", "Big Agnes", 4, "Ultra Light"],
  ["Three Island UL2", "Big Agnes", 2, "Ultra Light"],
  ["Blacktail 2", "Big Agnes", 2, "Backpacking"],
  ["Blacktail 3", "Big Agnes", 3, "Backpacking"],
  ["Foidel Canyon 2", "Big Agnes", 2, "Backpacking"],
  ["Foidel Canyon 3", "Big Agnes", 3, "Backpacking"],
  ["Tumble 2 mtnGLO", "Big Agnes", 2, "Backpacking"],
  ["Shield 2", "Big Agnes", 2, "Mountaineering"],
  ["Battle Mountain 2", "Big Agnes", 2, "Mountaineering"],
  ["Battle Mountain 3", "Big Agnes", 3, "Mountaineering"],
  ["Rabbit Ears 4", "Big Agnes", 4, "Car/Base Camping"],
  ["Flying Diamond 6", "Big Agnes", "6 ", "Car/Base Camping"],
  ["Flying Diamond 8", "Big Agnes", "8 ", "Car/Base Camping"],
  ["Tensleep Station 4", "Big Agnes", 4, "Car/Base Camping"],
  ["Tensleep Station 6", "Big Agnes", "6 ", "Car/Base Camping"],
  ["Big House 4", "Big Agnes", 4, "Car/Base Camping"],
  ["Big House 6", "Big Agnes", "6 ", "Car/Base Camping"],
  ["Chimney Creek 6 mtnGlo", "Big Agnes", "6 ", "Car/Base Camping"],
  ["Gilpin Falls Powerhouse 4 mtnGLO", "Big Agnes", 4, "Car/Base Camping"],
  ["Wyoming Trail 4", "Big Agnes", 4, "Car/Base Camping"],
  ["Skyledge 2", "Mountain Hardwear", 2, "Ultra Light"],
  ["SuperMegaUL 1", "Mountain Hardwear", 1, "Ultra Light"],
  ["SuperMegaUL 1", "Mountain Hardwear", 1, "Ultra Light"],
  ["Shifter 3", "Mountain Hardwear", 3, "Backpacking"],
  ["Shifter 2", "Mountain Hardwear", 2, "Backpacking"],
  ["Skyledge 2", "Mountain Hardwear", 2, "Ultra Light"],
  ["Trango 2", "Mountain Hardwear", 2, "Mountaineering"],
  ["Trango 3", "Mountain Hardwear", 3, "Mountaineering"],
  ["EV 2", "Mountain Hardwear", 2, "Mountaineering"],
  ["EV 3", "Mountain Hardwear", 3, "Mountaineering"],
  ["Hubba Hubba NX", "MSR", 2, "Backpacking"],
  ["Mutha Hubba NX", "MSR", 3, "Backpacking"],
  ["Papa Hubba NX", "MSR", 4, "Backpacking"],
  ["Elixir 2", "MSR", 2, "Backpacking"],
  ["Elixir 3", "MSR", 3, "Backpacking"],
  ["Carbon Reflex 1", "MSR", 1, "Ultra Light"],
  ["Carbon Reflex 2", "MSR", 2, "Ultra Light"],
  ["Carbon Reflex 3", "MSR", 3, "Ultra Light"],
  ["Backcountry Barn Basecamp", "MSR", 5, "Car/Base Camping"],
  ["Fury", "MSR", 2, "Mountaineering"],
  ["Stormking", "MSR", 5, "Mountaineering"]
]

bags = [
  ["Trestles 30", "Marmot", 30, "Synthetic"],
  ["Trestles 15", "Marmot", 15, "Synthetic"],
  ["Sunset 20", "Marmot", 20, "Synthetic"],
  ["NanoWave 45", "Marmot", 45, "Synthetic"],
  ["Cloudbreak 30", "Marmot", 30, "Synthetic"],
  ["Cloudbreak 0", "Marmot", 0, "Synthetic"],
  ["Always Summer", "Marmot", 40, "Down"],
  ["Never Winter", "Marmot", 30, "Down"],
  ["Atom", "Marmot", 40, "Down"],
  ["Col MemBrain", "Marmot", -20, "Down"],
  ["Never Summer", "Marmot", 0, "Down"],
  ["Plasma 40", "Marmot", 40, "Down"],
  ["Plasma 15", "Marmot", 15, "Down"],
  ["Plasma 30", "Marmot", 30, "Down"],
  ["Lithium", "Marmot", 0, "Down"],
  ["Spectre", "Mountain Hardwear", 20, "Down"],
  ["Phantom 15", "Mountain Hardwear", 15, "Down"],
  ["Phantom 0", "Mountain Hardwear", 0, "Down"],
  ["Womens Heratio 32", "Mountain Hardwear", 32, "Down"],
  ["Womens Phantasia", "Mountain Hardwear", 32, "Down"],
  ["Ratio 32", "Mountain Hardwear", 32, "Down"],
  ["Ratio 45", "Mountain Hardwear", 45, "Down"],
  ["Wraith", "Mountain Hardwear", 0, "Down"],
  ["Womens Phantasia 0", "Mountain Hardwear", 0, "Down"],
  ["Mtn Speed 32", "Mountain Hardwear", 32, "Down"],
  ["Womens Laminina 20", "Mountain Hardwear", 20, "Synthetic"],
  ["Mens Lamina 35", "Mountain Hardwear", 35, "Synthetic"],
  ["Womens Laminina 35", "Mountain Hardwear", 35, "Synthetic"],
  ["Mens Lamina 45", "Mountain Hardwear", 45, "Synthetic"],
  ["Mens Lamina 20", "Mountain Hardwear", 20, "Synthetic"]
]

User.all.each do |user|

  rand(4).times do
    bag = bags.sample
    Sleepingbag.create!(user_id: user.id, name: bag[0], brand: bag[1], temp_rating: bag[2], size: bag_size, condition: condition, fill: bag[3])
  end


  rand(4).times do
    pack = packs.sample
    Backpack.create!(user_id: user.id, name: pack[0], brand: pack[1], capacity: pack[2], size: pack_size, condition: condition, gender: pack[3])
  end

  rand(3).times do
    tent = tents.sample
    Tent.create!(user_id: user.id, name: tent[0], brand: tent[1], capacity: tent[2], use: tent[3], condition: condition)
  end
end

puts "#{User.all.count} users were generated"
puts "#{Sleepingbag.all.count} sleepingbags were created"
puts "#{Backpack.all.count} packs were created"
puts "#{Tent.all.count} tents were created"
