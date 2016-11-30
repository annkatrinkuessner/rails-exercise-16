require 'rails_helper'

RSpec.describe Author, type: :model do

  context `with Alan Turing as author` do

    it "the name methods returns the full name of an Author" do
    a = Author.new
    a.first_name = "Alan"
    a.last_name = "Turing"

    expect(a.name).to eq('Alan Turing')
  end

  end
end
