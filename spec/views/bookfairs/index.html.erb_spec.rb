require 'spec_helper'

describe "bookfairs/index.html.erb" do
  before(:each) do
    assign(:bookfairs, [
      stub_model(Bookfair,
        :name => "Name",
        :created_by => 1,
        :updated_by => 1
      ),
      stub_model(Bookfair,
        :name => "Name",
        :created_by => 1,
        :updated_by => 1
      )
    ])
  end

  it "renders a list of bookfairs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
