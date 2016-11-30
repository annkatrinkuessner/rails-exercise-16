require 'rails_helper'

describe "Author creation page", :type => :feature do

  it "should display 'New Author'" do
    visit '/authors/new'

    expect(page).to have_text("New Author")
  end

  it "should have a 'First Name' input field" do
    visit '/authors/new'

    expect(page).to have_text("First name")
  end

  it "should have a 'Last Name' input field" do
    visit '/authors/new'

    expect(page).to have_text("Last name")
  end

  it "should have a 'Homepage' input field" do
    visit '/authors/new'

    expect(page).to have_text("Homepage")
  end

  it "should have a submit button 'Save Author'" do
    visit '/authors/new'

    expect(page.find_button("Save Author").value).to eq("Save Author")
  end

  it "should create new author instances" do
    visit '/authors/new'
    fill_in('First name', with: 'Alan')
    fill_in('Last name', with: 'Turing')
    fill_in('Homepage', with: "http://wikipedia.org/Alan_Turing")
    click_button("Save Author")

    expect(Author.where(first_name:'Alan', last_name: 'Turing', homepage: "http://wikipedia.org/Alan_Turing")).to exist
  end

end