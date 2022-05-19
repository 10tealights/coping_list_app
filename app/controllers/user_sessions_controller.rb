class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(coping_lists_path, notice: t('.login_success'))
    else
      flash[:alert] = t('.login_failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to(login_url, notice: t('.logout_success'))
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
