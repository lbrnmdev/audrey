require 'rails_helper'

RSpec.describe RevenueController, type: :controller do

  describe "GET #commissions" do
    it "returns http success" do
      get :commissions
      expect(response).to have_http_status(:success)
    end
  end

end
