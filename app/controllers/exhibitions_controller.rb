class ExhibitionsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def exhibition_params
    params.require(:exhibition).permit(:image, :name, :text, :price, :category_id,
                                       :status_id, :fee_id, :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
