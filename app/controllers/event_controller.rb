class EventController < ApplicationController
  def index
    render json: Event.all
  end

  def new
    event = Event.new filtered_params
    event.save!
    current_user.events += [event]
    current_user.save!
    render json: event
  end

  def show
    render json: Event.find_by_id(params[:id])
  end

  def update

  end

  def destroy
    event = Event.find_by_id(params[:id])

    # can only delete events owned by user
    if event.user.id == current_user.id
      event.destroy
    end

    render json: event
  end

  private
    def filtered_params
      params.require(:event).permit(:id, :name, :address, :description)
    end
end
