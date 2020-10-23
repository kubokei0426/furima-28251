class PurchasersController < ApplicationController
  before_action :set_exhibition, only: [:index, :create]

  def index
    redirect_to root_path unless user_signed_in?
  end

  def create
    @purchaser_shipping = PurchaserShipping.new(shipping_params)
    if @purchaser_shipping.valid?
      pay_purchaser
      @purchaser_shipping.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_purchaser
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @exhibition.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end

  private

  def shipping_params
    params.permit(:token, :exhibition_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, purchaser_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
end
