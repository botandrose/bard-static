require "spec_helper"

describe "Rendering mockups", type: :feature do
  it "renders index.html.erb at /mockups with no layout" do
    visit "/mockups"
    expect(page.body).to_not include("LAYOUT")
    expect(page.body).to include("MOCKUP INDEX FILE")
  end

  it "renders sites.html.erb at /mockups/sites with no layout" do
    visit "/mockups/sites"
    expect(page.body).to_not include("LAYOUT")
    expect(page.body).to include("MOCKUP SITES FILE")
  end

  it "renders posts/new.html.erb at /mockups/posts/new with no layout" do
    visit "/mockups/posts/new"
    expect(page.body).to_not include("LAYOUT")
    expect(page.body).to include("MOCKUP NEW POST FILE")
  end

  it "renders posts/index.html.erb at /mockups/posts with no layout" do
    visit "/mockups/posts"
    expect(page.body).to_not include("LAYOUT")
    expect(page.body).to include("MOCKUP POST INDEX FILE")
  end

  it "renders partials with no layout" do
    visit "/mockups/posts/new"
    expect(page.body).to_not include("LAYOUT")
    expect(page.body).to include("MOCKUP FORM PARTIAL")
  end

  it "renders a 404 when path doesn't exist" do
    expect {
      visit "/mockups/this/is/not/here"
    }.to raise_error(ActionView::MissingTemplate)
  end
end

describe "Rendering static", type: :feature do
  it "renders index.html.erb at / with layout" do
    visit "/"
    expect(page.body).to include("LAYOUT")
    expect(page.body).to include("STATIC INDEX FILE")
  end

  it "renders sites.html.erb at /sites with layout" do
    visit "/sites"
    expect(page.body).to include("LAYOUT")
    expect(page.body).to include("STATIC SITES FILE")
  end

  it "renders posts/new.html.erb at /posts/new with layout" do
    visit "/posts/new"
    expect(page.body).to include("LAYOUT")
    expect(page.body).to include("STATIC NEW POST FILE")
  end

  it "renders posts/index.html.erb at /posts with layout" do
    visit "/posts"
    expect(page.body).to include("LAYOUT")
    expect(page.body).to include("STATIC POST INDEX FILE")
  end

  it "renders partials with layout" do
    visit "/posts/new"
    expect(page.body).to include("LAYOUT")
    expect(page.body).to include("STATIC FORM PARTIAL")
  end

  it "renders a 404 when path doesn't exist" do
    expect {
      visit "/this/is/not/here"
    }.to raise_error(ActionController::RoutingError)
  end
end

