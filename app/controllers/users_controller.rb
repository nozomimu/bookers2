class UsersController < ApplicationController
  before_action :authenticate_user!

def new
    end

def create
  @user = User.new(params[:user])
  user.save
  redirect_to show_user_path
end

def show
	@user = User.find(params[:id])
  @users = User.all
end

  def edit
  	@user = User.find(params[:id])#userIDの受け渡し
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  private
  def user_params
  	params.require(:user).permit(:title,:body)
  end
end
