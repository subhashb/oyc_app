require 'spec_helper'

describe "bookfairs/edit.html.erb" do
  before(:each) do
    @bookfair = assign(:bookfair, stub_model(Bookfair,
      :name => "MyString",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit bookfair form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookfairs_path(@bookfair), :method => "post" do
      assert_select "input#bookfair_name", :name => "bookfair[name]"
      assert_select "input#bookfair_created_by", :name => "bookfair[created_by]"
      assert_select "input#bookfair_updated_by", :name => "bookfair[updated_by]"
    end
  end
end
