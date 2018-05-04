# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Micropost.create title:"Micropost #{i}", content: "this is content", image_url: "https://genknews.genkcdn.vn/2018/5/1/anh-4-15251841648941567745603.jpg"
end
