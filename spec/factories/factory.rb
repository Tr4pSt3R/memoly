require 'factory_girl'
require 'faker'

FactoryGirl.define do
	factory :user, :class => User do 
		firstname 'Jones'
		lastname 'Agyemang'
		email	 Faker::Internet.email
		password 'testtest'
	end

	factory :memoid do
		title "Git"
		note  "$brew install automake"
	end
end