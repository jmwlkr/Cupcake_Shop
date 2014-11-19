class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user.nil?
      flash[:alert] = "User not Found"
      redirect_to "/"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Congrats you successfully Registered"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your information"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.posts.destroy_all # TODO REFACTOR
    @user.comments.destroy_all # TODO REFACTOR
    @user.shops.destroy_all # TODO REFACTOR
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:fname,:lname)
  end

end