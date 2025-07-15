class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def create
    @event = Event.find(params[:event_id])

    if current_user.attendances.create(attended_event: @event)
      redirect_back fallback_location: root_url, notice: "Joined successfully!"
    else
      flash.now[:alert] = "Something went wrong."
      render "events/show", status: :unprocessable_entity
    end
  end
end
