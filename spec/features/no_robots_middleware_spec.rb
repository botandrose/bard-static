require "spec_helper"

describe "No robots middleware", type: :feature do
  let :no_robots_tag do
    '<meta name="robots" content="noindex, nofollow"/>'
  end

  it "adds the no robots tag to prototypes" do
    visit "/mockups"
    expect(page.body).to include(no_robots_tag)
  end

  it "doesn't add anything in other controllers" do
    visit "/not_a_prototype"
    expect(page.body).to include("NOT A PROTOTYPE")
    expect(page.body).to_not include(no_robots_tag)
  end
end
