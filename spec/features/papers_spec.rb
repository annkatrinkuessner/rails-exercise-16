require 'rails_helper'

describe "New  paper page", :type => :feature do

  it"should have text input for title, venue, and year" do
    visit new_paper_path
    expect(page).to have_text("New Paper")
    #expect(page).to have_text("title")
    #expect(page).to have_text("venue")
    #expect(page).to have_text("year")
  end

end