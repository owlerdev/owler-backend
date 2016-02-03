require 'rails_helper'

RSpec.describe EventController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user

    @event = create(:event)
  end

  describe "GET event#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST event#new" do
    it "creates a new object" do
      Event.destroy_all
      post :create, event: @event.attributes
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['name']).to eq(@event.name)
    end
  end

  describe "GET event#show" do
    before do
      @event = create(:event)
    end

    it "returns an event" do
      get :show, id: @event.id
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to equal(@event.id)
    end
  end

  describe "update event" do
    it "modifies an event with PATCH" do
      patch :update, id: @event.id, event: {address: "new address"}
      expect(JSON.parse(response.body)['address']).to eq("new address")
    end

    it "modifies an event with PUT" do
      @event.address = "new address"
      put :update, id: @event.id, event: @event.attributes
      expect(JSON.parse(response.body)['address']).to eq("new address")
    end
  end

  describe "DELETE event" do
    before(:each) do
      @another_user = create(:another_user)
      @another_event = create(:another_event)

      @user.events += [@event]
      @another_user.events += [@another_event]
    end

    it "destroys event owned by user" do
      delete :destroy, id: @event.id
      expect(response).to have_http_status(:success)
      expect(Event.exists?(@event.id)).to be false
    end

    it "does not destroy another user's event" do
      delete :destroy, id: @another_event.id
      expect(response).to have_http_status(:error)
      expect(Event.exists?(@another_event.id)).to be true
    end

    it "can't destroy something that doesn't exist" do
      Event.destroy_all
      delete :destroy, id: 1
      expect(response).to have_http_status(:error)
    end
  end

end