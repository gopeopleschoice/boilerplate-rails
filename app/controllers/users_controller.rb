class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # redirect_to root_url, notice: t("users.create.sucess")
    else
      # render "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_url, notice: t("users.update.success")
    else
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
