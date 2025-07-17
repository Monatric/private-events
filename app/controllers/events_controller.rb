class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = current_user.events.build
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @other_users = User.where.not(id: current_user)
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

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_back fallback_location: root_url, notice: "Event updated succesfully!"
    else
      flash.now[:alert] = "Event cannot be updated."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to profile_url(username: current_user.username), notice: "Event deleted sucessfully!", status: :see_other
  end

  private

    def event_params
      params.expect(event: [ :title, :location, :details, :event_date ])
    end
end
