require "spec_helper"

feature "Creating Projects" do
  scenario "can create a project" do
    visit "/"
    click_link "New Project"
    fill_in "Name", with: "TextMate 2"
    fill_in "Description", with: "A Mac OS X text editor"
    click_button "Create Project"
    page.should have_content("Project has been created.")
  end
end
