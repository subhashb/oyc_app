require 'spec_helper'

describe "Stockaudititems" do
  describe "GET /stockaudititems" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stockaudititems_path
      response.status.should be(302)
    end
  end
end
