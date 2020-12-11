class BuyersController < ApplicationController
  before_action :find_product

  def index
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)
    if buyer.valid?
      @buyer.save
      return redirect_to product_buyers_path(@product.id)
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:price)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

end
