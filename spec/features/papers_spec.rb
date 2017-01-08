require 'rails_helper'

describe "New  paper page", :type => :feature do

  it"should have text input for title, venue, and year" do
    visit new_paper_path
    expect(page).to have_text("New Paper")
    expect(page).to have_text("Title")
    expect(page).to have_text("Venue")
    expect(page).to have_text("Year")
  end

  it "should have a submit button" do
    visit new_paper_path
    expect(page).to have_css("input[type='submit']")

  end

end