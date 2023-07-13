# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Carla', role: 'parent', email: '@test1@gmail.com')
user2 = User.create(name: 'Carol', role: 'parent', email: '@test2@gmail.com')
user3 = User.create(name: 'Brenda', role: 'parent', email: '@test3@gmail.com')
user4 = User.create(name: 'Sarah', role: 'parent', email: '@test4@gmail.com')
user5 = User.create(name: 'Uena', role: 'babysitter', email: '@test5@gmail.com')
user6 = User.create(name: 'Laura', role: 'parent', email: '@test6@gmail.com')
user7 = User.create(name: 'Tonia', role: 'parent', email: '@test7@gmail.com')
user8 = User.create(name: 'Gracie', role: 'parent', email: '@test8@gmail.com')
user9 = User.create(name: 'John', role: 'parent', email: '@test9@gmail.com')

appt1 = Connection.create(followed_id: user1.id, follower_id: user2.id, date: Date.today)
appt2 = Connection.create(followed_id: user1.id, follower_id: user3.id, date: Date.today)
appt3 = Connection.create(followed_id: user1.id, follower_id: user4.id, date: Date.today)
appt4 = Connection.create(followed_id: user1.id, follower_id: user5.id, date: Date.today)
appt5 = Connection.create(followed_id: user1.id, follower_id: user6.id, date: Date.today)
appt6 = Connection.create(followed_id: user1.id, follower_id: user7.id, date: Date.today)

Playdate.create(inviter_id: user1.id, invitee_id: user2.id, date: Date.today)
Playdate.create(inviter_id: user1.id, invitee_id: user3.id, date: Date.today)
Playdate.create(inviter_id: user1.id, invitee_id: user4.id, date: Date.today)
Playdate.create(inviter_id: user1.id, invitee_id: user7.id, date: Date.today)
Playdate.create(inviter_id: user1.id, invitee_id: user5.id, date: Date.today)
Playdate.create(inviter_id: user1.id, invitee_id: user6.id, date: Date.today)
