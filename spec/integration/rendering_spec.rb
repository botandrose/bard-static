require "spec_helper"

describe "Rendering mockups" do
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

describe "Rendering static" do
  it "renders index.html.erb at / with layout" do
    get "/"
    response.body.should include("LAYOUT")
    response.body.should include("STATIC INDEX FILE")
  end

  it "renders sites.html.erb at /sites with layout" do
    get "/sites"
    response.body.should include("LAYOUT")
    response.body.should include("STATIC SITES FILE")
  end

  it "renders posts/new.html.erb at /posts/new with layout" do
    get "/posts/new"
    response.body.should include("LAYOUT")
    response.body.should include("NEW POST FILE")
  end

  it "renders partials with layout" do
    get "/posts/new"
    response.body.should include("LAYOUT")
    response.body.should include("FORM PARTIAL")
  end
end

