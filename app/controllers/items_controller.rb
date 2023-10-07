class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.category_id = 1
    @item.condition_id = 1
    @item.postage_type_id = 1
    @item.prefecture_id = 1
    @item.shipping_time_id = 1
    binding.pry

    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price).merge(user_id: current_user.id)
    # params.require(:item).permit(:name, :info, :category_id, :condition_id, :price, :postage_type_id, :prefecture_id, :shipping_time_id).merge(user_id: current_user.id)
  end
end
