require 'rails_helper'

RSpec.describe PapersController, type: :controller do

  describe "new Paper Page" do
    it"should render" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
