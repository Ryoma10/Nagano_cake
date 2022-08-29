class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(params_cart_item)
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
        end
      end
    @cart_item.save
    redirect_to cart_items_path,notice: "カートに商品が入りました"

  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end


  private

  def params_cart_item
    params.permit(:amount, :item_id, :customer_id)
  end

end