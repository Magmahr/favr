j = User.create!(first_name: "Jared", last_name: "Mills", email: "jared@gmail.com", password:'12345')
m = User.create!(first_name: "Matt", last_name: "Maher", email: "matt@gmail.com", password:'steve')
bob = User.create!(first_name: "Bob", last_name: "Barker", email: "bob@gmail.com", password:'12345')
kanye = User.create!(first_name: "Kanye", last_name: "West", email: "yeezy@gmail.com", password:'12345')
donald = User.create!(first_name: "Donald", last_name: "Trump", email: "treason4lyfe@gmail.com", password:'12345')
stevie = User.create!(first_name: "Stevie", last_name: "Nix", email: "fleetwood@gmail.com", password:'12345')


f = Favor.create(name: "Walk Dog", description: "walk my dog while I'm at work today", date: Time.now + 60, requester_id: 1)

r = Review.create(title: "TERRIBLE", content: "Unreliable at best", rating: 0, favor_id: 1, user_id: 2)

c = Comment.create(favor_id: 1, user_id: 1, content: "That's not a fair assessment")
