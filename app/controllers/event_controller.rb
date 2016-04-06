class EventController < ApplicationController
  include Geokit

  def index
    render json: Event.all
  end

  def create
    event = Event.new filtered_params
    event.user = current_user

    if event.valid?
      event.save!
      current_user.events += [event]
      current_user.save!
    else
      head :error
      return
    end

    render json: event
  end

  def show
    render json: Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])

    if event.update_attributes(filtered_params)
      render json: event
    else
      head :error
    end
  end

  def destroy
    # can only delete events owned by current user
    event = Event.find_by(id: params[:id], user_id: current_user.id)

    if event.nil?
      # todo: different error code?
      head :error
    else
      event.destroy
      render json: event
    end
  end

  private
    def filtered_params
      params.require(:event).permit(:id, :name, :address, :description, :start_t, :end_t)
    end
end


