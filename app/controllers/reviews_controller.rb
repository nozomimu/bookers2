class ReviewsController < ApplicationController
  before_action :authenticate_user!,except: [:top,:about]

  def new
    @reviews = Review.all
    @review = Review.find(params[:id])
  end

  def show
  	@review = Review.find(params[:id])
    @reviews = Review.all
  end

  def create
  	 review = Review.new(review_params)
     review.save
     redirect_to review_path(review)
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	review = Review.find(params[:id])
  	review.update(review_params)
  	redirect_to review_path(review)
  end

  def destroy
  	review = Review.find(params[:id])
  	review.destroy
    redirect_to :action => 'index'
  end

  def top
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def about
  end

  def index
    @reviews = Review.all
    @review = Review.find(params[:id])

  end

  

  private
  def review_params
  	params.require(:review).permit(:title, :body)
  end

end
