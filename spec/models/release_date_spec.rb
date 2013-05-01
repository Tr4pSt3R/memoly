require 'spec_helper'

describe ReleaseDate do
	describe "#ReleaseDate Associations" do 
		it { should belong_to(:memoid) }
	end
end
