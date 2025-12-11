class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  # enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3, cancelled: 4 }
  enum :status, [ :pending, :confirmed, :shipped, :delivered, :cancelled ]
end
