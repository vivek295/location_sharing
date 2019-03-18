# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([{email: 'test1@test.com', password: 'password', password_confirmation: 'password'},
                    {email: 'test2@test.com', password: 'password', password_confirmation: 'password'}])

Post.create({longitude: '88.32',lattitude: '22.67', location_name: 'Test', public: false, share_with: [1], user: user.last})
