require "spec_helper"

feature "Creating Projects" do
  scenario "can create a project" do
    visit "/"
    click_link "New Project"
    fill_in "Name", with: "TextMate 2"
    fill_in "Description", with: "A Mac OS X text editor"
    click_button "Create Project"
    page.should have_content("Project has been created.")

    project = Project.find_by_name("TextMate 2")
    page.current_url.should == project_url(project)
    title = "TextMate 2 - Projects - Ticketee"
    find("title").should have_content(title)
  end

  scenario "can not create a project without a name" do
    visit '/'
    click_link 'New Project'
    click_button 'Create Project'
    page.should have_content("Project has not been created.")
    page.should have_content("Name can't be blank")
  end
end
