require 'spec_helper'

describe "bookfairs/show.html.erb" do
  before(:each) do
    @bookfair = assign(:bookfair, stub_model(Bookfair,
      :name => "Name",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
