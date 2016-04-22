class VoteController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.new
    vote.user = current_user
    vote.event = Event.find_by(id: filtered_params[:id])

    if vote.valid?
      vote.save!
    else
      head :error
      return
    end

    render json: vote
  end

  def destroy
    # can only delete user's votes
    vote = Vote.find_by(id: params[:id], user_id: current_user.id)

    if vote.nil?
      head :error
    else
      vote.destroy
      render json: vote
    end
  end

  private
    def filtered_params
      params.require(:event).permit(:id)
    end
end
