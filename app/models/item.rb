class Item < ApplicationRecord
  has_many :reservation_items
  has_many :reservations, through: :reservation_items
end
