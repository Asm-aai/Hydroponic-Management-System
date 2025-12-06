class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :plant

  validatables :quantity, numericality: { greater_than: 0 }
end
