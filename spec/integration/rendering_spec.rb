require "spec_helper"

describe "Rendering" do
  it "renders index.html.erb at /mockups" do
    get "/mockups"
    response.body.should include("INDEX FILE")
  end

  it "renders sites.html.erb at /mockups/sites" do
    get "/mockups/sites"
    response.body.should include("SITES FILE")
  end

  it "renders posts/new.html.erb at /mockups/posts/new" do
    get "/mockups/posts/new"
    response.body.should include("NEW POST FILE")
  end

  it "renders partials" do
    get "/mockups/posts/new"
    response.body.should include("FORM PARTIAL")
  end
end
