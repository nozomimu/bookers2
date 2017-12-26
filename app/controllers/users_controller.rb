class UsersController < ApplicationController
  before_action :authenticate_user!,expect:[:top,:about]


def new
    end

def create
  @user = User.new(params[:user])
  if @user.save
  redirect_to user_path(@user.id)
else
  render 'show'
end
end

def show
	@user = User.find(params[:id])
  @post_image = PostImage.new
end

  def edit
  @user = User.find(params[:id])#userIDの受け渡し
  end

  def update
  	@user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(current_user.id)
        else
        flash[:notice] = "エラーが発生しました。"
            @post_images = PostImage.all
            redirect_to user_path(current_user.id)
        end
  end

  def index
  @post_image = PostImage.new
  @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    user.destroy
    redirect_to post_images_path
  end


  private
  def user_params
  	params.require(:user).permit(:title,:body,:profile_image,:name)
  end
end
