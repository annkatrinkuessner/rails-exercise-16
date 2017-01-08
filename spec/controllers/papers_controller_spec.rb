require 'rails_helper'

RSpec.describe PapersController, type: :controller do

  it"should exist a new papers page" do
    get:new
    expect(response).to have_http_status(:success)
  end

end
