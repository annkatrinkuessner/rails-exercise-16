require 'rails_helper'

RSpec.describe Author, type: :model do

  context `with Alan Turing as author` do

    it "the name methods returns the full name of an Author" do
    a = Author.new
    a.first_name = "Alan"
    a.last_name = "Turing"

    expect(a.name).to eq('Alan Turing')
    end

    context "author creation" do
      it "should not validate without last name" do
        a = Author.new
        a.first_name = "Alan"
        expect(a).to_not be_valid
      end

      it "should not validate without first name" do
        a = Author.new
        a.last_name = "Turing"
        expect(a).to_not be_valid
      end

      it "should not validate without homepage" do
        a = Author.new
        a.first_name = "Alan"
        expect(a).to_not be_valid
      end
    end

  end
end
