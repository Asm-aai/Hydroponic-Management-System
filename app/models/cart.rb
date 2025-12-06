class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :cart_item, dependent: :destroy
end
