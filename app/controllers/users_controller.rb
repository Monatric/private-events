class UsersController < ApplicationController
  before_action :require_same_account

  def show
    @user = current_user
    @past_events = current_user.attended_events.where("event_date < ?", DateTime.now)
    @future_events = current_user.attended_events.where("event_date > ?", DateTime.now)
  end

  private

    def require_same_account
      if !user_signed_in? || current_user.username != params[:username]
        redirect_back fallback_location: root_url, alert: "You are not allowed to view that."
      end
    end
end
