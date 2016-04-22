require 'rails_helper'
require 'devise'

RSpec.describe UserController, type: :controller do
  # before(:each) do
    # @user = create(:user)
    # sign_in @user
  # end

  describe "GET #index" do
    # it "returns http success" do
    #   get :index
    #   expect(response).to have_http_status(:success)
    # end
    it "logs a user in" do
      get :index, { user_email: "example@example.com", password: "password" }
      binding.pry
    end
  end

end
