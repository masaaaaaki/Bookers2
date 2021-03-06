class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @book = Book.new
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follewer'
  end

  private
    def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
    end
end

def corrent_user
  @user = User.find(params[:id])
  if current_user != @user
    redirect_to user_path(current_user.id)
  end
end