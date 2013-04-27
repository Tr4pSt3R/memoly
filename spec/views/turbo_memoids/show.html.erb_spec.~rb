require 'spec_helper'

describe "turbo_memoids/show" do
  before(:each) do
    @turbo_memoid = assign(:turbo_memoid, stub_model(TurboMemoid,
      :filename => "Filename",
      :filetype => "Filetype"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Filename/)
    rendered.should match(/Filetype/)
  end
end
