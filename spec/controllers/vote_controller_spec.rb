require 'rails_helper'

RSpec.describe VoteController, type: :controller do
  before(:each) do
    @event = create(:event)
    @future_event = create(:future_event)
    sign_in @event.user
  end

  describe "POST vote#create" do
    it "upvotes an event that has started" do
      post :create, event: @event.attributes
      expect(response).to have_http_status(:success)
      expect(@event.upvotes).to eq(1)
    end

    it "adds hype to an event in the future" do
      post :create, event: @future_event.attributes
      expect(response).to have_http_status(:success)
      expect(@future_event.hype).to eq(1)
    end
  end

  describe "DELETE vote" do 
    before(:each) do
      post :create, event: @event.attributes
      @vote = Vote.first
    end

    it "deletes a user's upvote" do
      delete :destroy, id: @event.id
      expect(response).to have_http_status(:success)
      expect(@vote).to eq(nil)
    end
  end
end
