require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name",
        :scope => "Scope"
      ),
      stub_model(Group,
        :name => "Name",
        :scope => "Scope"
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Scope".to_s, :count => 2
  end
end
