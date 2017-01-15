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

  it "should link to index page" do
    visit new_paper_path
    expect(page).to have_css("a", text: "Back")
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

  it "should link to the new paper page" do
    visit papers_path
    expect(page).to have_css("a", text:"add paper")
  end

end

describe "Edit paper page", :type => :feature do

  it "should render" do
    paper = create(:paper)
    visit edit_paper_path(paper)
  end

  it "should link to the paper index page" do
    paper = create(:paper)
    visit edit_paper_path(paper)
    expect(page).to have_css("a", text:"Back")
  end

  it "should update year" do
    paper = create(:paper)
    visit edit_paper_path(paper)
    fill_in("Year", with: "2017")
    click_button("Submit")
    expect(page).to have_text("2017")
  end

  it "should update venue" do
    paper = create(:paper)
    visit edit_paper_path(paper)
    fill_in("Venue", with: "UIST")
    click_button("Submit")
    expect(page).to have_text("UIST")
  end

  it "should update title" do
    paper = create(:paper)
    visit edit_paper_path(paper)
    fill_in("Title", with: "Awesome Paper")
    click_button("Submit")
    expect(page).to have_text("Awesome Paper")
  end

end
