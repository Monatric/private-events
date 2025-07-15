class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = current_user.events.build
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_url, notice: "Event created successfully!"
    else
      flash.now[:alert] = "Event cannot be created."
      render :new, status: :unprocessable_entity
    end
  end

  private

    def event_params
      params.expect(event: [ :title, :location, :details, :event_date ])
    end
end
