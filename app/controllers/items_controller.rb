class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  private
   def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, 
      :delivery_fee_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
   end
end
