class PurchasersController < ApplicationController
  before_action :set_exhibition, only: [:index,:create]

  def index 
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def create
    binding.pry
    @purchaser_shipping = PurchaserShipping.new(shipping_params)
    if @purchaser_shipping.valid?
      pay_purchaser
      @purchaser_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_purchaser
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @exhibition.price,
      card: purchaser_params[:token],
      currency: 'jpy',
    )
    @exhibition.update(purchaser_id: current_user.id)
  end

  private
  def shipping_params
    params.require(:purchaser_shipping).permit(:token,:postal_code,:city,:addresses,:phone_number,:city,:prefecture_id,:building,:exhibition_id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end


end
