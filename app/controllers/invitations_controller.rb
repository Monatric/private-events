class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:event])
    @invitee = User.find(params[:invitee])

    current_user.invitations.create!(event: @event, invitee: @invitee)
    redirect_back fallback_location: root_url, notice: "Invited #{@invitee.username} successfully!"
  end
end
