class Plant < ApplicationRecord
  has_many :measurements, dependent: :destroy
end
