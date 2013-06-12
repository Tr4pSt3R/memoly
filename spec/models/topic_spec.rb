require 'spec_helper'

describe Topic do
  context "Associations" do
  	it { should have_many(:memoids)}
  end
end
