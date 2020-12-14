class BuyersController < ApplicationController
  before_action :find_product
  
  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.permit(:postal_code, :prefecture_id,:city, :address, :buildind, :phone_number, :product_id).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
