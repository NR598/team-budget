# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Norman', email: 'norman@test.com', password: '123456')
User.create!(name: 'Justin', email: 'justin@test.com', password: '123456')
User.create!(name: 'Tarra', email: 'tarra@test.com', password: '123456')
Transaction.create!(name: 'Rent', amount: '-1250', user_id: '1')
Transaction.create!(name: 'Cell Phone', amount: '-95', user_id: '2')
Transaction.create!(name: 'Food', amount: '-24', user_id: '3')
Income.create!(name: 'Pay Check', amount: '500', user_id: '1')
Income.create!(name: 'Lottery Winnings', amount: '3000', user_id: '2')
Income.create!(name: 'Tax Return', amount: '1000', user_id: '3')
Note.create!(body: 'Its getting more and more expensive.', user_id: '1', income_id: '1', transaction_id: '1')
Note.create!(body: 'Yay!!!', user_id: '2', income_id: '2', transaction_id: '2')
Note.create!(body: 'Finally, took long enough!!', user_id: '3', income_id: '3', transaction_id: '3')