require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "New Author Page" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
