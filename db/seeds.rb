# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


matt = User.create(:name => "Matt")
samir = User.create(:name => "Samir")

favorites = Poll.create(:title => "Favorites", :user_id => 1)
food = Question.create(:text => "What's your favorite food?", :poll_id => 1)
pizza = Answer.create(:text => "Pizza", :question_id => 1)
pasta = Answer.create(:text => "Pasta", :question_id => 1)
shouldnt_be_added = Answer.create(:text => "Pasta", :question_id => 1)
response1 = Response.create(:user_id => 2, :answer_id => 1)
#this shouldn't add the response, as user_id = 1 made the question
response2 = Response.create(:user_id => 1, :answer_id => 2)

place = Question.create(:text => "What's your favorite place?", :poll_id => 1)
italy = Answer.create(:text => "Italy", :question_id => 2)
mexico = Answer.create(:text => "Mexico", :question_id => 2)
should_be_added = Answer.create(:text => "Pasta", :question_id => 2)
response1 = Response.create(:user_id => 2, :answer_id => 2)
response2 = Response.create(:user_id => 1, :answer_id => 1)



history = Poll.create(:title => "History", :user_id => 2)
president = Question.create(:text => "First president?", :poll_id => 2)
washington = Answer.create(:text => "Washington", :question_id => 3)
lincoln = Answer.create(:text => "Lincoln", :question_id => 3)
response1 = Response.create(:user_id => 1, :answer_id => 1)
response2 = Response.create(:user_id => 1, :answer_id => 1)

capital = Question.create(:text => "Where is Albany", :poll_id => 2)
jersey = Answer.create(:text => "New Jersey", :question_id => 4)
york = Answer.create(:text => "New York", :question_id => 4)
response1 = Response.create(:user_id => 1, :answer_id => 2)
#A user can only respond once to a question
response2 = Response.create(:user_id => 1, :answer_id => 1)