class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to root_url, notice: t("sessions.login")
    else
      flash.now.alert = t("sessions.invalid_credentials")
      # render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t("sessions.logout")
  end
end
