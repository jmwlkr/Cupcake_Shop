class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email]).first

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      session[:cart] = []
      flash[:notice] = "You are now logged in"
      redirect_to "/users/#{ @user.id }"
    else
      flash[:alert] = ["Incorrect values"]
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart] = []
    redirect_to "/sessions/new"
  end

  private

  def sessions_params
    params.require(:user).permit(:email,:password)
  end

end
