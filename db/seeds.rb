
# Create users

victoria = User.create(name: "Victoria", email: "victoria@victoria.com", password: "puppy1")
michael = User.create(name: "Michael", email: "michael@michael.com", password: "puppy2")

# Create some pupdates

Pupdate.create(title: "First post!", content: "Today the puppy learned to shake paws!", user_id: victoria.id)

# Use ActiveRecord to pre-associate data:

victoria.pupdates.create(title: "Second post!", content: "Today the puppy learned to roll over!")

michaels_entry = michael.pupdates.build(title: "Michael's post", content: "Taught the puppy not to bark at the mailman!")
michaels_entry.save