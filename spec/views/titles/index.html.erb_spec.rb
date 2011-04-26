require 'spec_helper'

describe "titles/index.html.erb" do
  before(:each) do
    assign(:titles, [
      stub_model(Title,
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :author => "Author",
        :grossamt => 1.5,
        :currency => "Currency",
        :conv_rate => 1.5,
        :discount => 1.5,
        :netamt => 1.5,
        :bookfair_id => 1,
        :copies_cnt => 1,
        :sold_cnt => 1,
        :created_by => 1,
        :modified_by => 1
      ),
      stub_model(Title,
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :author => "Author",
        :grossamt => 1.5,
        :currency => "Currency",
        :conv_rate => 1.5,
        :discount => 1.5,
        :netamt => 1.5,
        :bookfair_id => 1,
        :copies_cnt => 1,
        :sold_cnt => 1,
        :created_by => 1,
        :modified_by => 1
      )
    ])
  end

  it "renders a list of titles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
