# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do 
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)    
)
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
)
 admin.skip_confirmation!
 admin.save!


50.times do
  item = Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample    
)
end
puts "Seeds finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."
  
  