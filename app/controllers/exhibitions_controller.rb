class ExhibitionsController < ApplicationController
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

end