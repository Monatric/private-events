class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :join ]

  def join
    @attended_event = current_user.attended_events.build
    puts params
  end
end
