require 'rails_helper'

RSpec.describe "Covers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/covers/index"
      expect(response).to have_http_status(:success)
    end
  end

end
