# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
f = Favor.create(name: "Walk Dog", description: "walk my dog", date: Time.now , requester_id: 1)

j = User.create(first_name: "Jared", last_name: "Test", email: "ugh@gmail.com")
m = User.create(first_name: "Matt", last_name: "Testo", email: "ugho@gmail.com")



r = Review.create(title: "TERRIBLE", content: "TOTAL WITCH HUNT", rating: 0, favor_id: 1, user_id: 2)

c = Comment.create(favor_id: 1, user_id: 1, content: "You're Putin's puppet!")
