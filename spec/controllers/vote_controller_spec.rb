require 'rails_helper'

RSpec.describe VoteController, type: :controller do
  before(:each) do
    # create an event in the past
    @event = create(:event)

    # create an event in the future
    @future_event = create(:future_event)
    sign_in @event.user
  end

  describe "POST vote#create" do
    it "upvotes an event that has started" do
      # upvote the event in the past
      post :create, event: @event.attributes
      expect(response).to have_http_status(:success)
      expect(@event.upvotes).to eq(1)
    end

    it "adds hype to an event in the future" do
      # add hype to event in the future
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
      # delete the signed in user's upvote
      delete :destroy,  id: @vote.id
      expect(response).to have_http_status(:success)
      expect(Vote.exists?(@vote.id)).to be false
    end

    it "can't delete another user's upvote" do
      # future_event is by another user
      sign_out @event.user
      sign_in @future_event.user
      post :create, event: @future_event.attributes
      expect(response).to have_http_status(:success)
      vote = JSON.parse(response.body)
      sign_out @future_event.user

      # sign in another user, try to delete other user's upvote
      sign_in @event.user
      binding.pry
      delete :destroy, id: vote["id"]
      expect(response).to have_http_status(:error)
    end
  end
end
