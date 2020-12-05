class Purpose < ApplicationRecord
  has_many :reservation_purposes
  has_many :reservations, through: :reservation_purposes
end
