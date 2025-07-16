class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def create
    @event = Event.find(params[:event_id])

    current_user.attendances.create!(attended_event: @event)
    redirect_back fallback_location: root_url, notice: "Joined successfully!"
  end

  def destroy
    @event = Event.find(params[:id])
    @event.attendees.destroy(current_user)
    redirect_back fallback_location: root_url, notice: "Unjoined successfully!"
  end
end
