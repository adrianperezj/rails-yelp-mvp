class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to restaurant_review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review = Review.update(review_params)
    redirect_to restaurant_review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
