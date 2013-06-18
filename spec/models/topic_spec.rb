require 'spec_helper'

describe Topic do
  context "Associations" do
  	it { should have_many(:memoids)}
  end

  context "create topic from memoid" do 
  	memoid = FactoryGirl.build(:memoid, 
  								:note => "#BeforeFilters Before filters are methods that get executed before controller actions. They are incredibly powerful part of the standard #Rails toolboox, and help us to remove duplication across controllers and actions, change the path of execution for an incoming request, and even stop a request dead in its tracks")

  	
  	

  	

  end
end
