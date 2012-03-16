require "spec_helper"

describe "Rendering mockups" do
  it "renders index.html.erb at /mockups with no layout" do
    get "/mockups"
    response.body.should_not include("LAYOUT")
    response.body.should include("MOCKUP INDEX FILE")
  end

  it "renders sites.html.erb at /mockups/sites with no layout" do
    get "/mockups/sites"
    response.body.should_not include("LAYOUT")
    response.body.should include("MOCKUP SITES FILE")
  end

  it "renders posts/new.html.erb at /mockups/posts/new with no layout" do
    get "/mockups/posts/new"
    response.body.should_not include("LAYOUT")
    response.body.should include("MOCKUP NEW POST FILE")
  end

  it "renders partials with no layout" do
    get "/mockups/posts/new"
    response.body.should_not include("LAYOUT")
    response.body.should include("MOCKUP FORM PARTIAL")
  end

  it "renders a 404 when path doesn't exist" do
    get "/mockups/this/is/not/here"
    response.status.should == 404
    response.body.should == "Not Found"
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
    response.body.should include("STATIC NEW POST FILE")
  end

  it "renders partials with layout" do
    get "/posts/new"
    response.body.should include("LAYOUT")
    response.body.should include("STATIC FORM PARTIAL")
  end

  it "renders a 404 when path doesn't exist" do
    get "/this/is/not/here"
    response.status.should == 404
    response.body.should == "Not Found"
  end
end

