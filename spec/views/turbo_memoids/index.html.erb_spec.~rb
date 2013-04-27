require 'spec_helper'

describe "turbo_memoids/index" do
  before(:each) do
    assign(:turbo_memoids, [
      stub_model(TurboMemoid,
        :filename => "Filename",
        :filetype => "Filetype"
      ),
      stub_model(TurboMemoid,
        :filename => "Filename",
        :filetype => "Filetype"
      )
    ])
  end

  it "renders a list of turbo_memoids" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Filetype".to_s, :count => 2
  end
end
