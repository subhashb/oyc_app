require "spec_helper"

describe BookfairsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/bookfairs" }.should route_to(:controller => "bookfairs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/bookfairs/new" }.should route_to(:controller => "bookfairs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/bookfairs/1" }.should route_to(:controller => "bookfairs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/bookfairs/1/edit" }.should route_to(:controller => "bookfairs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/bookfairs" }.should route_to(:controller => "bookfairs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/bookfairs/1" }.should route_to(:controller => "bookfairs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/bookfairs/1" }.should route_to(:controller => "bookfairs", :action => "destroy", :id => "1")
    end

  end
end
