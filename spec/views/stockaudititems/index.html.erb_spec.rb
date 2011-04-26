require 'spec_helper'

describe "stockaudititems/index.html.erb" do
  before(:each) do
    assign(:stockaudititems, [
      stub_model(Stockaudititem,
        :bookfair_id => 1,
        :isbn => "Isbn",
        :created_by => 1,
        :modified_by => 1
      ),
      stub_model(Stockaudititem,
        :bookfair_id => 1,
        :isbn => "Isbn",
        :created_by => 1,
        :modified_by => 1
      )
    ])
  end

  it "renders a list of stockaudititems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
