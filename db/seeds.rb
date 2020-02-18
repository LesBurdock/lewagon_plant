# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Plant.destroy_all
Booking.destroy_all

les = User.create!(
  password: "lesFun",
  email: "les@fun.com",
  name: 'Lesley',
  description: 'I am passionate about plants. I make it my mission to provide tips and tricks about how to take care of any plants.'
  )
serg = User.create!(
  password: "sergFun",
  email: "serg@fun.com",
  name:"serg",
  description: 'I am passionate about plants. I make it my mission to provide tips and tricks about how to take care of any plants.'
  )
planty = Plant.create!(
  name: "My Wonderful Cactus",
  description:"I know plants can’t slobber me with wet kisses and bark with delight when I return home; plants are not loyal or loving, or fluffy and fun – but they are helping me to learn how to care for something other than myself, so that is probably a good warmup for something more sentient in the distant future.",
  user_id: les.id ,
  care_instructions: "Succulents and cacti are low maintenance, water wise plants that store water in their leaves, stems or roots, creating a plump or succulent appearance. They are often found in hot, arid climates such as the desert and have adapted to tolerate long periods of drought. There are many varieties of succulents and cacti that come from all over the world. For best results each plant has individual needs, but there are general rules for succulent and cactus plant care. ",
  price: 10,
  latitude: 52.532190,
  longitude:13.420540,
  avail_from: Date.new(2020, 4, 4),
  avail_to: Date.new(2020, 6, 20),
  photo: "https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=818&q=80"
  )
cacty = Plant.create!(
  name: "My Sucky Succulent Collection",
  description:"we are already one lily down in our rented accommodation because my housemate ignored my instructions and left her plant outside. Mine is flourishing upstairs on my shelf and I have added a pretty, pink-tinged Chinese evergreen to my collection. Our third housemate also owns a few leafy beauties of her own",
  user_id: serg.id ,
  care_instructions: "Succulents love light and need about six hours of sun per day, depending on the type of succulent. Newly planted succulents can scorch in direct sunlight, so you may need to gradually introduce them to full sun exposure or provide shade with a sheer curtain.",
  price: 10,
  latitude: 52.5493,
  longitude:13.4137,
  avail_from: Date.new(2020, 2, 2),
  avail_to: Date.new(2020, 2, 5),
  photo: "https://res.cloudinary.com/dkefcoe8x/image/upload/v1582027782/clau-chases-colors-puP2reKn4iQ-unsplash_u3pfr1.jpg"
  )
booky = Booking.create(start_date: Date.new(2020, 1, 1), end_date: Date.new(2020, 1, 2), user_id: serg.id, plant_id: planty.id)
wooky = Booking.create(start_date: Date.new(2020, 2, 2), end_date: Date.new(2020, 2, 20), user_id: serg.id, plant_id: cacty.id)
