require 'spec_helper'

describe "turbo_memoids/new" do
  before(:each) do
    assign(:turbo_memoid, stub_model(TurboMemoid,
      :filename => "MyString",
      :filetype => "MyString"
    ).as_new_record)
  end

  it "renders new turbo_memoid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => turbo_memoids_path, :method => "post" do
      assert_select "input#turbo_memoid_filename", :name => "turbo_memoid[filename]"
      assert_select "input#turbo_memoid_filetype", :name => "turbo_memoid[filetype]"
    end
  end
end
