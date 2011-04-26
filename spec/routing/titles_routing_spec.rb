require "spec_helper"

describe TitlesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/titles" }.should route_to(:controller => "titles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/titles/new" }.should route_to(:controller => "titles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/titles/1" }.should route_to(:controller => "titles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/titles/1/edit" }.should route_to(:controller => "titles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/titles" }.should route_to(:controller => "titles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/titles/1" }.should route_to(:controller => "titles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/titles/1" }.should route_to(:controller => "titles", :action => "destroy", :id => "1")
    end

  end
end
