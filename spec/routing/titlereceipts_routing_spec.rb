require "spec_helper"

describe TitlereceiptsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/titlereceipts" }.should route_to(:controller => "titlereceipts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/titlereceipts/new" }.should route_to(:controller => "titlereceipts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/titlereceipts/1" }.should route_to(:controller => "titlereceipts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/titlereceipts/1/edit" }.should route_to(:controller => "titlereceipts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/titlereceipts" }.should route_to(:controller => "titlereceipts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/titlereceipts/1" }.should route_to(:controller => "titlereceipts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/titlereceipts/1" }.should route_to(:controller => "titlereceipts", :action => "destroy", :id => "1")
    end

  end
end
