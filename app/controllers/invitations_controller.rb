class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_invitation_existence, only: [ :create ]

  def create
    @event = Event.find(params[:event])
    @invitee = User.find(params[:invitee])

    current_user.invitees.create!(event: @event, invitee: @invitee)
    redirect_back fallback_location: root_url, notice: "Invited #{@invitee.username} successfully!"
  end

  private

    def verify_invitation_existence
      @event = Event.find(params[:event])
      @invitee = User.find(params[:invitee])

      if @invitee.invited_to?(@event)
        redirect_back fallback_location: root_url, alert: "#{@invitee.username} has already been invited."
      end
    end
end
