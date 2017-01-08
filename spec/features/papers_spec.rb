require 'rails_helper'

describe "New paper page", :type => :feature do

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

  it "should save the paper" do
    visit new_paper_path
    fill_in('Title', with: 'COMPUTING MACHINERY AND INTELLIGENCE')
    fill_in('Venue', with: 'Mind 49: 433-460')
    fill_in('Year', with: 1950)
    click_button('Submit')
    expect(Paper.where(Title:'COMPUTING MACHINERY AND INTELLIGENCE', Venue: 'Mind 49: 433-460', Year: 1950)).to exist
  end

  it "should show validation errors for missing title" do
    visit new_paper_path
    fill_in('Venue', with: 'Mind 49: 433-460')
    fill_in('Year', with: 1950)
    click_button('Submit')
    expect(page).to have_text("Title can't be blank")
  end

  it "should show validation errors for missing year" do
    visit new_paper_path
    fill_in('Title', with: 'COMPUTING MACHINERY AND INTELLIGENCE')
    fill_in('Venue', with: 'Mind 49: 433-460')
    click_button('Submit')
    expect(page).to have_text("Year can't be blank")
  end

  it "should show validation errors for missing venue" do
    visit new_paper_path
    fill_in('Title', with: 'COMPUTING MACHINERY AND INTELLIGENCE')
    fill_in('Year', with: 1950)
    click_button('Submit')
    expect(page).to have_text("Venue can't be blank")
  end

end

describe "Paper index page", :type => :feature do

  it "should show title, venue and year of all papers" do
  create(:paper)
  visit papers_path
  expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
  expect(page).to have_text("1950")
  expect(page).to have_text("Mind 49: 433-460")
  end
end