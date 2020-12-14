class BuyersController < ApplicationController
  before_action :find_product
  before_action :authenticate_user!
  before_action :move_to_root_path

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_product
      @buyer_address.save
      @product.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.permit(
      :postal_code, :prefecture_id, :city, :address, :buildind, :phone_number, :product_id
    ).merge(user_id: current_user.id, token: params[:token])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path if (current_user.id == @product.user_id) || @product.buyer_id.present?
  end
end
