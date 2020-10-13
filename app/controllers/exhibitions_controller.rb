class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:destroy, :show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @exhibitions = Exhibition.all.order('created_at DESC')
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

  def destroy
     if @exhibition.user_id == current_user.id
        @exhibition.destroy
        redirect_to root_path
     end
   end

  def show
  end

  private

  def exhibition_params
    params.require(:exhibition).permit(:image, :name, :text, :price, :category_id,
                                       :status_id, :fee_id, :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

end
