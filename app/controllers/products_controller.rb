class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :price, :text, :image, :status_id, :shipping_fee_id, :prefecture_id, :shipment_date_id, :category_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if (current_user.id != @product.user_id) || @product.buyer_id.present?
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
