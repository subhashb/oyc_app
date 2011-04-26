require 'spec_helper'

describe "titles/edit.html.erb" do
  before(:each) do
    @title = assign(:title, stub_model(Title,
      :isbn => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :author => "MyString",
      :grossamt => 1.5,
      :currency => "MyString",
      :conv_rate => 1.5,
      :discount => 1.5,
      :netamt => 1.5,
      :bookfair_id => 1,
      :copies_cnt => 1,
      :sold_cnt => 1,
      :created_by => 1,
      :modified_by => 1
    ))
  end

  it "renders the edit title form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => titles_path(@title), :method => "post" do
      assert_select "input#title_isbn", :name => "title[isbn]"
      assert_select "input#title_title", :name => "title[title]"
      assert_select "input#title_publisher", :name => "title[publisher]"
      assert_select "input#title_author", :name => "title[author]"
      assert_select "input#title_grossamt", :name => "title[grossamt]"
      assert_select "input#title_currency", :name => "title[currency]"
      assert_select "input#title_conv_rate", :name => "title[conv_rate]"
      assert_select "input#title_discount", :name => "title[discount]"
      assert_select "input#title_netamt", :name => "title[netamt]"
      assert_select "input#title_bookfair_id", :name => "title[bookfair_id]"
      assert_select "input#title_copies_cnt", :name => "title[copies_cnt]"
      assert_select "input#title_sold_cnt", :name => "title[sold_cnt]"
      assert_select "input#title_created_by", :name => "title[created_by]"
      assert_select "input#title_modified_by", :name => "title[modified_by]"
    end
  end
end
