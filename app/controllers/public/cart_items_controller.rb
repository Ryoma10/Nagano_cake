class Public::CartItemsController < ApplicationController
  def create
    cart_item = Cart_item.new(cart_item)
    cart_item.item_id =
    cart_item.save
    redirect_to cart_items_path(@item.id)
  end

  def index
  end
end
