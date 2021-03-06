class PostImagesController < ApplicationController
  before_action :authenticate_user!
	def new
    @post_image = PostImage.new
    @post_images = PostImage.all
    end

    def create
    @post_image = PostImage.new(post_image_params)
    # @post_imagef = PostImage.find(current_user.id)
    @post_image.user_id = current_user.id
        if @post_image.save
            redirect_to post_image_path(@post_image.id)
        else
        flash[:notice] = "エラーが発生しました。"
            @post_images = PostImage.all
            redirect_to user_path(current_user.id)
        end
    end

    def index
    @post_images = PostImage.all
    @post_image = PostImage.new
    # @post_imagef = PostImage.find(current_user.id)
    end

    def show
    @post_image = PostImage.new
    @post_imagef = PostImage.find(params[:id])
    end

    def edit
    @post_imagef = PostImage.find(params[:id])
    end

    def books
    @post = PostImage.new
    @post_image = PostImage.all
    end

    def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image.id)
    end

    def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to user_path(current_user.id)
  end

    private
    def post_image_params
    params.require(:post_image).permit(:title, :body)
    end

end
