class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {
    credit: 0,  #クレジットカード
    bank: 1,  #銀行振込
  }

  enum status: {
    waiting: 0, #入金待ち
    check: 1, #入金確認
    making: 2,  #製作中
    preparation: 3,  #発送準備
    shipped_out: 4, #発送済み
  }

end
