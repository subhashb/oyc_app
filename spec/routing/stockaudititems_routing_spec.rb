require "spec_helper"

describe StockaudititemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stockaudititems" }.should route_to(:controller => "stockaudititems", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/stockaudititems/new" }.should route_to(:controller => "stockaudititems", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/stockaudititems/1" }.should route_to(:controller => "stockaudititems", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/stockaudititems/1/edit" }.should route_to(:controller => "stockaudititems", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/stockaudititems" }.should route_to(:controller => "stockaudititems", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/stockaudititems/1" }.should route_to(:controller => "stockaudititems", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stockaudititems/1" }.should route_to(:controller => "stockaudititems", :action => "destroy", :id => "1")
    end

  end
end
