require "spec_helper"

describe BillitemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/billitems" }.should route_to(:controller => "billitems", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/billitems/new" }.should route_to(:controller => "billitems", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/billitems/1" }.should route_to(:controller => "billitems", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/billitems/1/edit" }.should route_to(:controller => "billitems", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/billitems" }.should route_to(:controller => "billitems", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/billitems/1" }.should route_to(:controller => "billitems", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/billitems/1" }.should route_to(:controller => "billitems", :action => "destroy", :id => "1")
    end

  end
end
