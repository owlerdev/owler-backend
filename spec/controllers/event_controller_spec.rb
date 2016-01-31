require 'rails_helper'

RSpec.describe EventController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    sign_in FactoryGirl.create(:user)
    @event = FactoryGirl.build(:event)
  end

  describe "GET event#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST event#new" do
    it "returns http success" do
      post :new, event: @event.attributes
    end
  end

  describe "GET event#show" do
    before do
      @event = FactoryGirl.create(:event)
    end

    it "returns the event" do
      get :show, id: @event.id
      response.body.should == @event.to_json
    end
  end

end