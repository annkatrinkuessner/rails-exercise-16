require 'rails_helper'


describe "Author index page", :type => :feature do

  it"should link to the new author page" do
    visit authors_path
    expect(page).to have_css("a", text:"Add author")
  end

  it "should have a link to delete an author" do
    author = create(:author)
    visit authors_path
    expect(page).to have_css("a", text:"Destroy")
    expect(author).to be_nil
  end

end

describe "Author Show Page", :type => :feature do

  it "should display the author's information" do
        author = create(:author)
        visit '/authors/1'

        expect(page).to have_text(author.first_name)
        expect(page).to have_text(author.last_name)
        expect(page).to have_text(author.homepage)
      end
end

describe "New author page", :type => :feature do

  it"should show validation errors" do
    visit new_author_path
    fill_in('First name', with: 'Alan')
    fill_in('Homepage', with: "http://wikipedia.org/Alan_Turing")
    click_button("Submit")
    expect(page).to have_text("Last name can't be blank")
  end

  it"should show validation errors for missing first name" do
    visit new_author_path
    fill_in('Last name', with: 'Turing')
    fill_in('Homepage', with: "http://wikipedia.org/Alan_Turing")
    click_button("Submit")
    expect(page).to have_text("First name can't be blank")
  end

  it"should show validation errors for missing homepage" do
    visit new_author_path
    fill_in('First name', with: 'Alan')
    fill_in('Last name', with: 'Turing')
    click_button("Submit")
    expect(page).to have_text("Homepage can't be blank")
  end

  it "should display 'Add Author'" do
    visit '/authors/new'

    expect(page).to have_text("Add Author")
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

  it "should have a submit button Submit" do
    visit '/authors/new'

    expect(page.find_button("Submit").value).to eq("Submit")
  end

  it "should create new author instances" do
    visit '/authors/new'
    fill_in('First name', with: 'Alan')
    fill_in('Last name', with: 'Turing')
    fill_in('Homepage', with: "http://wikipedia.org/Alan_Turing")
    click_button("Submit")

    expect(Author.where(first_name:'Alan', last_name: 'Turing', homepage: "http://wikipedia.org/Alan_Turing")).to exist
  end

  end

  describe "Edit author page", :type => :feature do

    it "should render" do
      author = create(:author)
      visit edit_author_path(author)
    end

    it "should update last name" do
      author = create(:author)
      visit edit_author_path(author)
      fill_in("Last name", with: 'Kay')
      click_button("Submit")
      expect(page).to have_text("Kay")
    end

    it "should update first name" do
      author = create(:author)
      visit edit_author_path(author)
      fill_in("First name", with: 'Hans')
      click_button("Submit")
      expect(page).to have_text("Hans")
    end

    it "should update homepage" do
      author = create(:author)
      visit edit_author_path(author)
      fill_in("Homepage", with: 'https://berglie.be')
      click_button("Submit")
      expect(page).to have_text('https://berglie.be')
    end


  end