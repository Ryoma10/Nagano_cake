class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @grand_total = @order.shipping_cost + @total.to_i
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.price_at_purchase = @order.total_payment
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_detail.item_id = cart_item.item.id
        @order_detail.amount = cart_item.amount
      end
    @order_detail.save
    @cart_items.destroy_all
    redirect_to complete_orders_path
  end


  def complete
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:total_payment, :payment_method, :postal_code, :address, :name)
  end

end
