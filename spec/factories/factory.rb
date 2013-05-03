require 'factory_girl'

FactoryGirl.define do
	factory :user, :class => User do 
		firstname 'Jones'
		lastname 'Agyemang'
		email	 'mightyj@hotmail.co.uk'
		password 'testtest'
	end

	factory :memoid do
		note  "$brew install automake"
	end
end