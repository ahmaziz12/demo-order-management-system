class Order < ApplicationRecord
  belongs_to :user

  validates :price, :quantity, :order_type, presence: true

  enum status: [:pending, :completed, :cancelled]
  enum order_type: [:buy, :sell]

  scope :completed_buy, -> { where(status: :completed, order_type: :buy) }

  # Query asked in demo
  # Order.where(user_id: 1, status: 'completed').sum(:quantity)

  def self.process_order(order)
    if order.buy?
      order.status = order.price < 1000 ? :completed : :cancelled
    elsif order.sell?
      order.status = order.price > 1000 ? :completed : :cancelled
    end
    order.save
  end
end
