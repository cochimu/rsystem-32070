class Staff < ApplicationRecord
  has_many :reservation_staffs
  has_many :reservations, through: :reservation_staffs
end
