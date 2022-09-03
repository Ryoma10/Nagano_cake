class ChangeColumnDefaultToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :shipping_cost, from: nil, to: "800"
  end
end
