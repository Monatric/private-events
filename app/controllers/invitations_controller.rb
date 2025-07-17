class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_invitation_existence, only: [ :create ]

  def create
    @event = Event.find(params[:event])
    @invitee = User.find(params[:invitee])

    current_user.invitations.create!(event: @event, invitee: @invitee)
    redirect_back fallback_location: root_url, notice: "Invited #{@invitee.username} successfully!"
  end

  private

    def verify_invitation_existence
      @event = Event.find(params[:event])
      @invitee = User.find(params[:invitee])

      if current_user.invitations.where(invitee_id: @invitee, event_id: @event).any?
        # if Invitation.invited_certain_user?(current_user, @invitee, @event).any?
        redirect_back fallback_location: root_url, alert: "#{@invitee.username} has already been invited."
      end
    end
end
