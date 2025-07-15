class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :join ]

  def join
    @event = Event.find(params[:event_id])

    if current_user.attended_events << @event
      redirect_back fallback_location: root_url, notice: "Joined successfully!"
    else
      flash.now[:alert] = "Something went wrong."
      render "events/show", status: :unprocessable_entity
    end
  end
end
