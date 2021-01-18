class Api::V1::ProductsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]
  before_action :find_product, only:[:show, :update, :destroy]

  def index
   @products= Product.all
   render json: @products
  end





  private

  def product_params
    params.require(:product).permit( :id, :name, :description, :price, :image_url, :category_id)
  end

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
