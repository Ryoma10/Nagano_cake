class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @total_amount = 0
  end

  def about
  end
end
