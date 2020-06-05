class ProductsController < ApplicationController
  before_action :only => [:new, :edit, :destroy, :update, :create] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
  def index
    @products = Product.all.pagination_request(params[:page]) 
    render :index 
  end

  def home 
    @products = Product.all
    @recent_three = Product.most_recent
    @top_rated = Product.top_rating
    render :home
  end

  def new
    @product = Product.new 

  end

  def create
    @product = Product.new(product_params)
    @product.product_photo.attach(params[:product][:product_photo])
    if @product.save
      flash[:notice] = "Product added to stock!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    @product.product_photo.attach(params[:product][:product_photo])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end