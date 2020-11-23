# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  BasicWord.create({
                       category: 1,
                       word: Faker::Creature::Animal.name
                   })
end

20.times do
  BasicWord.create({
                       category: 2,
                       word: Faker::Game.title
                   })
end

20.times do
  BasicWord.create({
                       category: 3,
                       word: Faker::Movie.title
                   })
end