class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = @order_details.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "check"
      @order_details.each do |order_detail|
        order_detail.making_status = "waiting"
        order_detail.save
      end
    end


    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end