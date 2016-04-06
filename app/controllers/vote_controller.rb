class VoteController < ApplicationController
  def create
    vote = Event.new filtered_params
    vote.user = current_user

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
    event = Event.find_by(id: params[:id], user_id: current_user.id)

    if vote.nil?
      head :error
    else
      vote.destroy
      render json: event
    end
  end

  private
    def filtered_params
      params.require(:event).permit(:id)
    end
end
