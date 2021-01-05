class Reservation < ApplicationRecord

  belongs_to :user
  has_many :reservation_staffs
  has_many :staffs, through: :reservation_staffs
  has_many :reservation_items
  has_many :items, through: :reservation_items
  has_many :reservation_purposes
  has_many :purposes, through: :reservation_purposes
  has_one :cover
end
