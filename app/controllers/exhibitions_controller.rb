class ExhibitionsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end
  def new
    @exhibitions = Exhibition.new
  end
  def create
    Exhibition.create(exhibition_params)
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(
      :image, :name, :text, :price, :category_id,
      :status_id, :fee_id, :prefecture_id, :delivery_id, :user_id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end