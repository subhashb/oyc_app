require 'spec_helper'

describe "stockaudititems/edit.html.erb" do
  before(:each) do
    @stockaudititem = assign(:stockaudititem, stub_model(Stockaudititem,
      :bookfair_id => 1,
      :isbn => "MyString",
      :created_by => 1,
      :modified_by => 1
    ))
  end

  it "renders the edit stockaudititem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stockaudititems_path(@stockaudititem), :method => "post" do
      assert_select "input#stockaudititem_bookfair_id", :name => "stockaudititem[bookfair_id]"
      assert_select "input#stockaudititem_isbn", :name => "stockaudititem[isbn]"
      assert_select "input#stockaudititem_created_by", :name => "stockaudititem[created_by]"
      assert_select "input#stockaudititem_modified_by", :name => "stockaudititem[modified_by]"
    end
  end
end
