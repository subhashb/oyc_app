require 'spec_helper'

describe "Titlereceipts" do
  describe "GET /titlereceipts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get titlereceipts_path
      response.status.should be(200)
    end
  end
end
