class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: {
    not_allowed: 0, #製作不可
    waiting: 1, #製作待ち
    making: 2,  #製作中
    making_complete: 3,  #製作完了
  }

end
