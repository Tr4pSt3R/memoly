require 'spec_helper'

describe Post do
  context "Validations" do 
  	it { should validate_presence_of :title }
  	it { should validate_presence_of :text }
  end
end
