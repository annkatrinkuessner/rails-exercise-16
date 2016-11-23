require 'rails_helper'

describe "Author creation page", :type => :feature do

  it "should display 'New Author'" do
    visit '/authors/new'
    expect(page).to have_text("New Author")
  end
end