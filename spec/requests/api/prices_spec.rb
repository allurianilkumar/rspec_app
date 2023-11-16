require 'rails_helper'

RSpec.describe "Api::Prices", type: :request do
  describe "GET /api/prices" do
    it "works! (now write some real specs)" do
      get api_prices_index_path
      expect(response).to have_http_status(200)
    end
  end
end
