class UsersController < ApplicationController
  def show
    @user = current_user

    if current_user.username != params[:username]
      redirect_to root_url, notice: "You are not allowed to view that."
    end
  end
end
