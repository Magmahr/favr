sj = User.create!(first_name: "Jared", last_name: "Mills", email: "jared@gmail.com", password:'12345')

m = User.create!(first_name: "Matt", last_name: "Maher", email: "matt@gmail.com", password:'steve')

bob = User.create!(first_name: "Bob", last_name: "Barker", email: "bob@gmail.com", password:'12345')

kanye = User.create!(first_name: "Kanye", last_name: "West", email: "yeezy@gmail.com", password:'12345')

donald = User.create!(first_name: "Donald", last_name: "Trump", email: "treason4lyfe@gmail.com", password:'12345')

barak = User.create!(first_name: "Barack", last_name: "Obama", email: "bobama@gmail.com", password:'12345')

stevie = User.create!(first_name: "Stevie", last_name: "Nix", email: "stevie@gmail.com", password:'12345')

User.create!(first_name: "Alex", last_name: "Trebek", email: "urinjeopardy@gmail.com", password:'12345')



Favor.create(name: "Walk My Dog", description: "Walk my dog while I'm at work today, he's a good boi", date: Time.now + 60, requester_id: 1)

Favor.create(name: "Do My Laundry", description: "I broke my arm and can't load the machine :(", date: Time.now + 60, requester_id: 2)

Favor.create(name: "Clean My Bathroom", description: "Toilets just ick me out, I promise I'll do an equally gross, but different Favr for you", date: Time.now + 60, requester_id: 3)

Favor.create(name: "Cook Dinner", description: "And then we can eat it together! I'm lonely...", date: Time.now + 60, requester_id: 4)

Favor.create(name: "Help Me Carry My Groceries", description: "IM OLD", date: Time.now + 60, requester_id: 5)

Favor.create(name: "PLEASE BE MY DATE FOR ONE NIGHT!", description: "My parents will be in town, and I've been saying I'm in relationship for months!", date: Time.now + 60, requester_id: 6)

Favor.create(name: "Move My Couch", description: "I won't lie, it's super heavy and I live in a 3 story walk up", date: Time.now + 60, requester_id: 7)

Favor.create(name: "I Need a Ride to the Meadowlands", description: "I have a rug, rolled up and a little stained, that needs burying.", date: Time.now + 60, requester_id: 8)



UserFavor.create(favor_id: 1, requester_id: 1, requestee_id: 6)

UserFavor.create(favor_id: 2, requester_id: 3, requestee_id: 4)



Review.create(title: "Great Job", content: "My pup was walked and happy", rating: 5, favor_id: 1, user_id: 1)

Review.create(title: "All of the lights (and darks)", content: "My laundry is so fresh and so clean, clean", rating: 5, favor_id: 2, user_id: 3)



Comment.create(favor_id: 1, user_id: 1, content: "I'll leave the leash by the door, thank you!")

Comment.create(favor_id: 1, user_id: 6, content: "Happy to help!")

Comment.create(favor_id: 2, user_id: 3, content: "I'll tell the doorman to expect you")

Comment.create(favor_id: 2, user_id: 4, content: "Poopity scoop")
