class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new 
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    # Code for edit product form goes here.
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    # Code for updating an product goes here.
  end

  def destroy
    # Code for deleting an product goes here.
  end

  private 
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end