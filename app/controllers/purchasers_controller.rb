class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exhibition, only: [:index, :create]
  before_action :ensure_user_id, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchaser_shipping = PurchaserShipping.new
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
    params.require(:purchaser_shipping).permit(:postal_code,:prefecture_id, :city, :addresses, :building,:phone_number).merge(token: params[:token], user_id: current_user.id, exhibition_id: @exhibition.id,purchaser_id:current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end

  def ensure_user_id
    redirect_to root_path if current_user.id == @exhibition.user_id
  end

  def move_to_index
    redirect_to root_path if @exhibition.purchaser.present?
  end
end
