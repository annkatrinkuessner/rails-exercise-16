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
end