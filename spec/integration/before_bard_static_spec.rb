require "spec_helper"

describe "#before_bard_static" do
  it "gets run when implemented in ApplicationController" do
    get "/mockups/notes"
    response.body.should include("BEFORE CARPENTRY")
  end
end
